/* Create a new tooltip.
 * Each thing that creates a tooltip puts up its own div.
 */
function makeTooltip() {
    var mapDiv = $('#map');
    tooltip = $('<div>');
    tooltip.addClass('tooltip');
    mapDiv.append(tooltip);

    return tooltip;
}

var MapInfo = {
    ///////////////////////////////
    // Set by initalizer functions
    map: null, // mm.Map() object

    ///////////////////////////////
    // Set by map-specific JS files
    selectedRoute: null,
    dataLayers: null,
    geojsonTooltips: null, // optional
    // For UTFGrid-enabled interactivity.
    interactivityUrl: null,
    //interactivityUrl: 'http://localhost:8888/api/Tileset/simple-bikeway-only-labels',
    onMapInitialized: null,

    initializeMap: function() {
        var that = this;
        var numCallbacks = 0;
        var mm = com.modestmaps;

        // The layers that are shown initially
        var initialDataLayers = this.dataLayers.filter(function(layer) {
            return layer.initial
        });

        // Once all the calbacks for the layers have finished, run this
        // to add the layers to the map. (All layers except the
        // first layer.)
        // 
        // http://stackoverflow.com/a/2911891/939467
        var createMapIfAllDataLoaded = function() {
            if (++numCallbacks == initialDataLayers.length) {
                // We have all the callbacks. Make the layers.
                var layers = initialDataLayers.map(function(dataLayer) {
                    var mapLayer = dataLayer.mapLayer;
                    if (mapLayer !== null) {
                        // When changing the route, this is the layer to toggle.
                        mapLayer.isViaLayer =
                            dataLayer.name.match(/^via-/) !== null;
                    }
                    return mapLayer;
                });
                layers.forEach(function(layer) {
                    // geojson polygons have layers that are 
                    // canvas elements and not "proper" map layers
                    if (layer !== null) {
                        that.map.addLayer(layer);
                        layer.draw();
                    }
                });

                
                // Setting the center before here doesn't really "take."
                // Try again. (yes, this is a huge kludge.)
                that.map.setCenter(MapInfo.initialCenter);
                that.map.setZoom(MapInfo.initialZoom);

                // Hide a race condition regarding the initial positioning of the photos.
                // Waiting this long seems to let them all initialize before placing them.
                setTimeout(function(){that.map.setZoom(MapInfo.initialZoom)}, 250);
            }
        };

        var makeTilestreamCallback = function(layerInfo) {
            return function(tilejson) {
                layerInfo.mapLayer = new wax.mm.connector(tilejson);
                createMapIfAllDataLoaded();
            };
        };

        var makeGeojsonCallback = function(layerInfo) {
            return function(geojson) {
                layerInfo.mapLayer = mmg();
                layerInfo.mapLayer.factory(layerInfo.geojsonFactory, layerInfo);
                layerInfo.mapLayer.geojson(geojson);

                createMapIfAllDataLoaded();

                if (layerInfo.geojsonAction !== undefined) {
                    layerInfo.geojsonAction(geojson, layerInfo);
                }
            };
        };
        
        var makeGeojsonPolygonCallback = function(layerInfo) {
            return function(geojson) {
                layerInfo.geojsonPolygon = 
                    makeGeojsonPolygonLayer(
                        geojson,
                        layerInfo.geojsonFeatureName,
                        that.map);

                layerInfo.mapLayer = null;
                createMapIfAllDataLoaded();

                addDistrictHandlers(layerInfo);
            }
        }

        // Load the first layer (must be a tilejson layer) and 
        // set up the map.
        var firstLayerInfo = initialDataLayers.shift();
        wax.tilejson(firstLayerInfo.url, function(firstTilejson) {
            var firstConnector = new wax.mm.connector(firstTilejson);
            that.map = new mm.Map('map', firstConnector);

            wax.mm.zoomer(that.map, firstConnector).appendTo(that.map.parent); 
            that.map.setZoomRange(firstTilejson.minzoom, firstTilejson.maxzoom);
            that.map.setCenter(MapInfo.initialCenter);

            var zoom = MapInfo.initialZoom;
            that.map.setZoom(zoom);
            $('#map').attr('data-zoom', zoom);
            that.map.addCallback('zoomed', function(map) {
                // When zoom level changes, update the map's data attribute
                $('#map').attr('data-zoom', map.coordinate.zoom);
            });

            // Now fire off requests for the rest of the layers.
            // Once they're ready, add them to the map in order.
            initialDataLayers.forEach(function(layerInfo) {
                if (layerInfo.type === 'tilestream') {
                    wax.tilejson(layerInfo.url, makeTilestreamCallback(layerInfo));
                }
                else if (layerInfo.type === 'geojson') {
                    $.getJSON(layerInfo.url, makeGeojsonCallback(layerInfo));
                }
                else if (layerInfo.type === 'geojson-polygon') {
                    $.getJSON(layerInfo.url, 
                              makeGeojsonPolygonCallback(layerInfo));
                }
                else {
                    throw "Unknown layer type " + layerInfo.type;
                }
            });
        });
    },

    layerForName: function(layerName) {
        for (var idx = 0; idx < this.dataLayers.length; idx++) {
            if (this.dataLayers[idx].name === layerName) {
                return this.dataLayers[idx];
            }
        }

        return null;
    },

    switchToLayer: function(layerName) {
        var layer = this.layerForName(layerName);
        var that = this;

        wax.tilejson(layer.url, function(tilejson) {
            var connector = new wax.mm.connector(tilejson);
            var layers = that.map.getLayers();

            for (var layerIndex = 0; layerIndex < layers.length; layerIndex++) {
                var layer = layers[layerIndex];
                if (layer.isViaLayer) {
                    // connector is a layer, not a provider. 
                    // Pass in its provider to the existing layer.

                    layer.setProvider(connector.provider);
                    that.selectedRoute = layerName;
                }
            }
        });
    },

    // Load the route endpoints
    endpointFactory: function(feature) {
        var point = $('<div></div>');
        point.addClass('route-endpoint');

        // Add the properties from the feature to the div
        for (var name in feature.properties) {
            var value = feature.properties[name];
            point.attr('data-' + name, value);
        }

        // The marker inside the div that gets styled.
        var marker = $('<div></div>');
        marker.addClass('marker');
        point.append(marker); 

        var domObject = point.get(0);
        return domObject;
    },
};

function switchRoute(newRoute) {
    // De-select the current route
    $('#routes .option.selected').each(function(index, element) {
        $(element).toggleClass('selected', false);
    });

    // Select this route
    $('#routes .option').filter(function (index) {
        return $(this).data('route') === newRoute;
    }).each(function(index, element) {
        $(element).toggleClass('selected', true);
    });

    MapInfo.switchToLayer(newRoute);

    // Do this after .switchToLayer has set MapInfo.selectedRoute
    $('.marker.per-route').each(function(index, marker) {
        setMarkerVisibility($(marker));
    });
}

function setMarkerVisibility(marker) {
    var routes = marker.attr('data-routes');
    var isForSelectedRoute = (routes.indexOf(MapInfo.selectedRoute) !== -1);
    var visibility = isForSelectedRoute ? 'visible' : 'hidden';
    marker.css('visibility', visibility);
}

function eventIsInElement(event, element) {
    var offset = element.offset();

    var x0 = offset.left;
    var y0 = offset.top;
    var x1 = x0 + element.outerWidth();
    var y1 = y0 + element.outerHeight();
    
    var inBounds = 
        event.pageX >= x0 &&
        event.pageX <= x1 &&
        event.pageY >= y0 &&
        event.pageY <= y1;
    
    var isVisible = 
        element.css('visibility') == 'visible';
    
    return inBounds && isVisible;
}

$(document).ready(function() {
    MapInfo.initializeMap();

    $('#routes .option').each(function(optionIdx, optionElement) {
        var option = $(optionElement);
        var routeName = option.data('route');

        var clickHandler = function(event) {
            switchRoute(routeName);
            event.stopPropagation();
        }

        option.find('.route-name').each(function(nameIdx, nameElement) {
            $(nameElement).click(clickHandler);
        });
        option.find('.label.clickable').each(function(nameIdx, nameElement) {
            $(nameElement).click(clickHandler);
        });
    });

    /* Problem: We want to have mouse interactivity with several layers,
     * but only HTML elements in the topmost layer get mousemove, etc., 
     * events.
     *
     * Solution: Have the entire map watch for mousemove events. It dispatches 
     * to children with the .listen-mousemove class.
     * See: http://stackoverflow.com/q/10371142/939467
     */
    var map = $('#map');
    map.mousemove(function(event) {
        // Don't call this when panning the map
        if (event.which !== 0) {
            return;
        }

        map.find('.listen-mousemove').each(function(idx, element) {
            element = $(element);
            if (eventIsInElement(event, element)) {
                element.trigger('map-mouseover');
            }
            else {
                element.trigger('map-mouseout');
            }
        });
    });
    map.click(function(event) {
        map.find('.listen-click').each(function(idx, element) {
            element = $(element);
            if (eventIsInElement(event, element)) {
                element.trigger('map-click');
            }
        });
    });

});

function positionMarkerForOffset(marker, zoom) {
    // Move the marker based on its zoom level & offset direction
    var offset, offsetX, offsetY;
    switch (zoom) {
    case 13:
        marker.find('img').width('30px');
        offset = 8;
        break;
    case 14:
        marker.find('img').width('45px');
        offset = 15;
        break;
    case 15:
        marker.find('img').width('70px');
        offset = 25;
        break;
    case 16:
        marker.find('img').width('100px');
        offset = 30;
        break;
    }

    var direction = marker.attr('data-offset_direction');
    var theta, xAttachType, yAttachType;
    switch (direction) {
    case 'east':
        theta = 0;
        xAttachType = 'left';
        yAttachType = 'center';
        break;
    case 'northeast':
        theta = Math.PI / 4;
        xAttachType = 'left';
        yAttachType = 'bottom';
        break;
    case 'north':
        theta = Math.PI / 2;
        xAttachType = 'center';
        yAttachType = 'bottom';
        break;
    case 'northwest':
        theta = (Math.PI * 3) / 4;
        xAttachType = 'right';
        yAttachType = 'bottom';
        break;
    case 'west':
        theta = Math.PI;
        xAttachType = 'right';
        yAttachType = 'center';
        break;
    case 'southwest':
        theta = (5 * Math.PI) / 4;
        xAttachType = 'right';
        yAttachType = 'top';
        break;
    case 'south':
        theta = (3 * Math.PI) / 2;
        xAttachType = 'center';
        yAttachType = 'top';
        break;
    case 'southeast':
        theta = (7 * Math.PI) / 4;
        xAttachType = 'left';
        yAttachType = 'top';
        break;
    }

    // Move the attach point of the marker by this much
    var offsetX = offset * Math.cos(theta);
    var offsetY = offset * Math.sin(theta) * -1;

    // Distance from the upper left to the attach point
    var xAttachDistance, yAttachDistance;
    switch (xAttachType) {
    case 'left':
        xAttachDistance = 0;
        break;
    case 'center':
        xAttachDistance = -1 * (marker.outerWidth() / 2);
        break;
    case 'right':
        xAttachDistance = -1 * (marker.outerWidth());
        break;
    }
    switch (yAttachType) {
    case 'top':
        yAttachDistance = 0;
        break;
    case 'center':
        yAttachDistance = -1 * (marker.outerHeight() / 2);
        break;
    case 'bottom':
        yAttachDistance = -1 * (marker.outerHeight());
        break;
    }

    var left = Math.round(offsetX + xAttachDistance);
    var top  = Math.round(offsetY + yAttachDistance);

    marker.css('position', 'relative');
    marker.css('top', top);
    marker.css('left', left);

}

function isRouteInThisMap(routes) {
    for (var layerIdx in MapInfo.dataLayers) {
        var layer = MapInfo.dataLayers[layerIdx];
        if (routes.indexOf(layer.name) !== -1) {
            return true;
        }
    }
    
    return false;
}

var featureForId = {};
function riderCommentFactory(feature) {
    /* For a route that's not part of this map.
     * Return a dummy div.
     */
    if (isRouteInThisMap(feature.properties['routes']) === false) {
        return $('<div>')
            .addClass('dummy')
            .get(0);
    }

    // Save the feature for when we add it to the sidebar
    featureForId[feature.properties['id']] = feature;

    var marker = $('<div></div>');
    marker.addClass('marker');
    marker.addClass('mood');
    marker.addClass('with-arrow');
    marker.addClass('listen-mousemove');

    // Add the properties from the feature to the div
    for (var name in feature.properties) {
        var value = feature.properties[name];
        marker.attr('data-' + name, value);
    }
    var moodText = $.trim(feature.properties['mood']);
    var isSevere = moodText.substr(-1) === '!'
    marker.attr('data-severe', isSevere);

    marker.append($('<p class="mood-text">').text(moodText));
    marker.append($('<p class="description hidden">')
                  .text(feature.properties['description']));


    var showDescription = function(event) {
        var description = $(event.target).find('.description');
        marker.parent().css('z-index', 999);

        marker.removeClass('with-arrow');
        description.removeClass('hidden');
    }

    var hideDescription = function(event) {
        var description = $(event.target).find('.description');
        marker.parent().css('z-index', 'auto');

        description.addClass('hidden');
        marker.addClass('with-arrow');
    }
    var zoomHandler = function(map) {
        positionMarkerForOffset(marker, map.coordinate.zoom);
    }
    marker.on('map-mouseover', showDescription);
    marker.on('map-mouseout', hideDescription);
    MapInfo.map.addCallback('zoomed', zoomHandler);
    zoomHandler(MapInfo.map);

    var point = $('<div>');
    point.append(marker);

    var domObject = point.get(0);
    return domObject;
}

function populateSidebar(geojson) {
    // Click handler for mood comments
    var makeClickHandler = function(commentId, lat, lon) {
        var onEasingComplete = function() {
            var targetSelector = '#map .marker.mood[data-id="' + commentId + '"]';
            $(targetSelector).each(function(idx, e) {
                var target = $(e);
                target.animate({backgroundColor: $.Color('yellow')}, {
                    complete: function() {
                        target.animate({backgroundColor: $.Color('white')});
                    },
                });
            });
        };

        return function(evt) {
            var to = MapInfo.map.locationCoordinate({lat: lat, lon: lon});
            var zoom = MapInfo.map.zoom();
            if (zoom <= 15) {
                zoom = 15
            }

            easey()
                .map(MapInfo.map)
                .to(to)
                .zoom(zoom)
                .run(1000, onEasingComplete);
        };
    };

    // Put mood comments into the directions
    var selector = '#directions .mood-container';
    $(selector).each(function(idx, e) {
        var moodDiv = $(e);
        var commentIds = moodDiv.attr('data-comment-ids');
        var table = $('<table>', {class: 'comments'});

        commentIds.split(' ').forEach(function(commentId) {
            var feature   = featureForId[commentId];
            // Don't crash for typos
            if (feature === undefined) {
                return;
            }

            var moodSpan = $('<span>');
            moodSpan.addClass('mood');
            moodSpan.text(feature.properties['mood']);
            moodSpan.click(makeClickHandler(commentId,
                                            feature.geometry.coordinates[1], 
                                            feature.geometry.coordinates[0]));

            var moodTd = $('<td>');
            moodTd.append(moodSpan);

            var descriptionTd = $('<td>');
            descriptionTd.text(feature.properties['description']);

            var row = $('<tr>');
            row.append(moodTd);
            row.append(descriptionTd);

            table.append(row);
        });

        moodDiv.append(table);

    });
}

function imageFactory(feature) {

    /* For a route that's not part of this map.
     * Return a dummy div.
     */
    if (isRouteInThisMap(feature.properties['routes']) === false) {
        return $('<div>')
            .addClass('dummy')
            .get(0);
    }

    // Automatically resized
    var thumb_url    = '/img/processed/' + 'thumb-'    + feature.properties['filename'];
    var expanded_url = '/img/processed/' + 'expanded-' + feature.properties['filename'];
    
    // Manually resized
    var highlight_url = '/img/photos/' + 'highlight-' + feature.properties['filename'];

    var img = $('<img>');
    img.attr('src', thumb_url);

    var imgHolder = $('<div>');
    imgHolder.append(img);
    imgHolder.addClass('marker');
    imgHolder.addClass('image');
    imgHolder.addClass('photo');
    imgHolder.addClass('listen-click');
    imgHolder.addClass('listen-mousemove');

    // Add the properties from the feature to the div
    for (var name in feature.properties) {
        var value = feature.properties[name];
        imgHolder.attr('data-' + name, value);
    }

    imgHolder.attr('data-thumb', thumb_url);
    imgHolder.attr('data-expanded', expanded_url);

    imgHolder.on('map-click', function(event) {
        $.fancybox.open(expanded_url, {
            arrows: false,
            closeBtn: true,
            closeClick: true,
            openEffect: 'fade',
            closeEffect: 'fade',
        });
    });
    // A token to keep track of who owns the mouse pointer
    var mouseOverOwner = null;
    imgHolder.on('map-mouseover', function(event) {
        $('#map-container').css('cursor', 'pointer');
        imgHolder.addClass('hover');
        mouseOverOwner = expanded_url;
    });
    imgHolder.on('map-mouseout', function(event) {
        if (mouseOverOwner === expanded_url) {
            $('#map-container').css('cursor', 'auto');
            mouseOverOwner = null;
        }
        imgHolder.removeClass('hover');
    });
    var zoomHandler = function(map) {
        positionMarkerForOffset(imgHolder, map.coordinate.zoom);
        
        var src = img.attr('src');
        if (map.coordinate.zoom <= 14) {
            img.attr('src', highlight_url);
        }
        else {
            img.attr('src', thumb_url);
        }
    }
    MapInfo.map.addCallback('zoomed', zoomHandler);
    zoomHandler(MapInfo.map);

    var point = $('<div>');
    point.append(imgHolder);

    var domObject = point.get(0);
    return domObject;
}


function elevationFactory(feature, routeName) {
    var map = MapInfo.map;

    var point = $('<div></div>');
    point.addClass('route-elevation');

    // Add the properties from the feature to the div
    point.attr('data-point-num', feature.properties['pointNum']);
    point.attr('data-accum-dst', feature.properties['accumDst']);
    point.attr('data-elevation', 
               Math.max(feature.properties['elevation-n-vancouver'],
                        feature.properties['elevation-s-vancouver']));
    point.attr('data-route', routeName);
    
    // The marker inside the div that gets styled.
    var marker = $('<div></div>');
    marker.addClass('marker');
    point.append(marker); 
    
    var domObject = point.get(0);
    return domObject;
}


function addElevationHandlers(routeName) {
    var lastPointNumOverall = null;
    var lastPointNumInRoute = null;
    function findLastPointNum(selector) {
        var lastPointNum = null;

        $(selector).each(function(idx, p) {
            var point = $(p);
            var pointNum = point.attr('data-point-num');
            pointNum = parseInt(pointNum, 10);
            if (lastPointNum === null || pointNum > lastPointNum) {
                lastPointNum = pointNum;
            }
        });

        return lastPointNum;
    };

    // Cache the circles along the route, for performance
    var circles = null;
    var cacheCircles = function() {
        circles = [];
        $('#map .route-elevation[data-route="' + routeName + '"]').each (function(idx, c) {        
            var circle = $(c);
            circles.push(circle);
        });
    };


    var unhighlightAll = function() {
        $('#map .route-elevation[data-route="' + routeName + '"]').each(function(idx, c) {
            //c.className.baseVal = removeClassName(c.className.baseVal, 'highlighted');
            $(c).toggleClass('highlighted', false);
        });
    };

    var optionDiv = $('.option[data-route="' + routeName + '"]');

    optionDiv.find('.route-scrubber').each(function(idx, e) {
        var scrubberDiv = $(e);

        scrubberDiv.mousemove(function(event) {
            //if (MapInfo.selectedRoute !== routeName) {
            //    return;
            //} 

            // Find position within the image
            var screenX = event.pageX;
            var imgX = screenX - scrubberDiv.offset().left;

            // Quit if we're in the part of the image w/ the elevation scale
            var paddingWidth = 29;
            if (imgX < paddingWidth) {
                unhighlightAll();
                optionDiv.find('.position-indicator').removeClass('visible');
                return;
            }

            // Find position in the range of values
            var pos = imgX - paddingWidth;
            var range = scrubberDiv.width() - paddingWidth;
            var pct = (pos * 1.0) / range;

            if (lastPointNumOverall === null) {
                lastPointNumOverall = findLastPointNum('#map .route-elevation');
            }
            if (lastPointNumInRoute === null) {
                lastPointNumInRoute = findLastPointNum('#map .route-elevation[data-route="' + routeName + '"]');
            }

            var targetPointNum = Math.round(pct * lastPointNumOverall);

            // Quit if we're past the end
            if (targetPointNum > lastPointNumInRoute) {
                unhighlightAll();
                optionDiv.find('.position-indicator').removeClass('visible');
                return;
            }

            optionDiv.find('.position-indicator')
                .addClass('visible')
                .css('left', imgX);

            if (circles === null) {
                cacheCircles();
            }
            circles.forEach(function(circle) {
                var pointNum = circle.attr('data-point-num');
                // Use == to compare string and int
                var isHighlighted = pointNum == targetPointNum;

                circle.toggleClass('highlighted', isHighlighted);

                
                // Uncomment this to show the position, in metres, 
                // of the highlighted point.
                // 
                // if (isHighlighted) {
                //    $('#to-from input[type="text"]').each(function(idx, input) {
                //        $(input).val( circle.attr('data-accum-dst') );
                //    });
                // }

            });
        });

        scrubberDiv.mouseout(function(event) {
            unhighlightAll();
            optionDiv.find('.position-indicator').removeClass('visible');
        });
        
    });
}

function addDistrictHandlers(layerInfo) {
    var rowSelector = 'table.districts tr[data-district="' + 
        layerInfo.geojsonFeatureName + 
        '"] ';
    var imgSelector = rowSelector + 'img';

    $(imgSelector).mouseenter(function(evt) {
        layerInfo.geojsonPolygon.show();
    });

    $(imgSelector).mouseleave(function(evt) {
        layerInfo.geojsonPolygon.hide();
    });
}


