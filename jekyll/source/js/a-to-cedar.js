MapInfo.selectedRoute = 'via-dumfries';
MapInfo.initialZoom = 14;
MapInfo.initialCenter = {
    lat: 49.233,
    lon: -123.0785,
};

MapInfo.dataLayers = [
    {
        name: 'base',
        url:  'http://a.tiles.mapbox.com/v3/evand.a-no-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'fraserview',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'fraserview',
    },
    {
        name: 'kensington',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'kensington', 
    },
    {
        name: 'kingsway',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'kingsway',
    },
    {
        name: 'via-dumfries',
        url: 'http://a.tiles.mapbox.com/v3/evand.a-to-cedar-via-dumfries-below-labels.jsonp',
        initial: true,
        type: 'tilestream',
    }, 
    {
        name: 'via-inverness',
        url:    'http://a.tiles.mapbox.com/v3/evand.a-to-cedar-via-windsor-below-labels.jsonp',
        initial: false,
        type: 'tilestream',
    },
    {
        name: 'labels',
        url:  'http://a.tiles.mapbox.com/v3/evand.a-only-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'endpoints',
        url:  '/data/route-endpoints.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: MapInfo.endpointFactory,
    },
    {
        name: 'comments',
        url:  '/data/rider-comments.geojson',
        initial: true,
        type: 'geojson',
        geojsonFactory: riderCommentFactory,
        geojsonAction:  populateSidebar,
    },
];

