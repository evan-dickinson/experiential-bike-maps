MapInfo.selectedRoute = 'via-pacific';
MapInfo.initialZoom = 14;
MapInfo.initialCenter = {
    lat: 49.277,
    lon: -123.11932589416503,
};

MapInfo.dataLayers = [
    {
        name: 'base',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-no-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'via-pacific',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-to-kits-via-pacific-below-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'via-first',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-to-kits-via-first-below-labels.jsonp',
        initial: false,
        type: 'tilestream',
    },
    {
        name: 'via-expo',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-to-kits-via-expo-below-labels.jsonp',
        initial: false,
        type: 'tilestream',
    },
    {
        name: 'labels',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-only-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'images',
        url:  '/data/images.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: imageFactory,
    },

    {
        name: 'endpoints',
        url:  '/data/route-endpoints.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: MapInfo.endpointFactory,
    },
    {
        name: 'elevation-fia-first',
        url:  '/data/elevation-via-first.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: function(feature) {
            return elevationFactory(feature, 'via-first');
        },
        geojsonAction:  function() {
            addElevationHandlers('via-first');
        },
    },
    {
        name: 'elevation-via-pacific',
        url:  '/data/elevation-via-pacific.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: function(feature) {
            return elevationFactory(feature, 'via-pacific');
        },
        geojsonAction:  function() {
            addElevationHandlers('via-pacific');
        },
    },
    {
        name: 'elevation-via-expo',
        url:  '/data/elevation-via-expo.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: function(feature) {
            return elevationFactory(feature, 'via-expo');
        },
        geojsonAction:  function() {
            addElevationHandlers('via-expo');
        }
    },

];




