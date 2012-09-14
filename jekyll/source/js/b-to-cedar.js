MapInfo.selectedRoute = 'via-dumfries';
MapInfo.initialZoom = 14;
MapInfo.initialCenter = {
    lat: 49.233,
    lon: -123.0785,
};

MapInfo.dataLayers = [
    {
        name: 'base',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-no-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'via-dumfries',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-to-cedar-via-dumfries-below-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'via-inverness',
        url:  'http://a.tiles.mapbox.com/v3/evand.b-to-cedar-via-windsor-below-labels.jsonp',
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
        name: 'elevation-fia-inverness',
        url:  '/data/elevation-via-inverness.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: function(feature) {
            return elevationFactory(feature, 'via-inverness');
        },
        geojsonAction:  function() {
            addElevationHandlers('via-inverness');
        },
    },
    {
        name: 'elevation-via-dumfries',
        url:  '/data/elevation-via-dumfries.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: function(feature) {
            return elevationFactory(feature, 'via-dumfries');
        },
        geojsonAction:  function() {
            addElevationHandlers('via-dumfries');
        },
    },
];

