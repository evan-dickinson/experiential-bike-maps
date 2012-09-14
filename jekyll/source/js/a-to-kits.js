MapInfo.selectedRoute = 'via-pacific';

MapInfo.initialZoom = 14;
MapInfo.initialCenter = {
    lat: 49.277,
    lon: -123.11932589416503,
};

MapInfo.dataLayers = [
    {
        name: 'base',
        url:  'http://a.tiles.mapbox.com/v3/evand.a-no-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'strathcona',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'strathcona',
    },
    {
        name: 'chinatown',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'chinatown',
    },
    {
        name: 'yaletown',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'yaletown',
    },
    {
        name: 'east-false-creek',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'east-false-creek',
    },
    {
        name: 'kits-point',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'kits-point',
    },
    {
        name: 'via-pacific',
        url:  'http://a.tiles.mapbox.com/v3/evand.a-to-kits-via-pacific-below-labels.jsonp',
        initial: true,
        type: 'tilestream',
    },
    {
        name: 'via-first',
        url:  'http://a.tiles.mapbox.com/v3/evand.a-to-kits-via-first-below-labels.jsonp',
        initial: false,
        type: 'tilestream',
    },
    {
        name: 'via-expo',
        url:  'http://a.tiles.mapbox.com/v3/evand.a-to-kits-via-expo-below-labels.jsonp',
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
        name: 'charleson',
        url:  '/data/neighbourhoods/neighbourhoods.geojson',
        initial: true,
        type: 'geojson-polygon',
        geojsonFeatureName: 'charleson',
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







