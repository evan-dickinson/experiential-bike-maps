
/* ---- ROADS ---- */

/* Motorway Links */
.route.line[highway='motorway_link'][tunnel='no'],
.route.tunnel[highway='motorway_link'] {
  [zoom>9] { line-color:@motorway_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.2 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}
.route.fill[highway='motorway_link'] {
  [zoom>11]{ line-color:@motorway_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@motorway_fill,10); }
  /*[zoom=11]{ line-width:0.8; }*/
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Trunk Links */
.route.line[highway='trunk_link'][tunnel='no'],
.route.tunnel[highway='trunk_link'] {
  [zoom>9] { line-color:@trunk_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.2 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}
.route.fill[highway='trunk_link'] {
  [zoom>11]{ line-color:@trunk_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@trunk_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Primary Links */
.route.line[highway='primary_link'][tunnel='no'],
.route.tunnel[highway='primary_link'] {
  [zoom>9] { line-color:@primary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.2 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}
.route.fill[highway='primary_link'] {
  [zoom>11]{ line-color:@primary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@primary_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Secondary Links */
.route.line[highway='secondary_link'][tunnel='no'],
.route.tunnel[highway='secondary_link'] {
  [zoom>9] { line-color:@secondary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.6; }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:0.9 + 1.8; }
  [zoom=13]{ line-width:1.0 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}
.route.fill[highway='secondary_link'] {
  [zoom>11]{ line-color:@secondary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@secondary_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Standard/Unknown */
.route.line[highway='living_street'],
.route.line[highway='residential'],
.route.line[highway='road'],
.route.line[highway='tertiary'],
.route.line[highway='tertiary_link'],
.route.line[highway='unclassified'] {
  [zoom>9] { line-color:@road_line; line-cap:round; line-join:round; }

  [zoom=13]{ line-width:0.8; }
  [zoom=14]{ line-width:1.0 + 1.8; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:6 + 2; }

}
.route.fill[highway='living_street'],
.route.fill[highway='residential'],
.route.fill[highway='road'],
.route.fill[highway='tertiary'],
.route.fill[highway='tertiary_link'],
.route.fill[highway='unclassified'] {
  [zoom>13]{ line-color:@road_fill; line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1.0; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:6; }
}

/* Secondary */
.route.line[highway='secondary'][tunnel='no'],
.route.tunnel[highway='secondary'] {
  [zoom>7] { line-color:@road_line; line-cap:round; line-join:round; }
  .tunnel[zoom>7] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  .tunnel[zoom>15]{ line-dasharray:10,2; }
  [zoom>11]{ line-color:@secondary_line; }

  [zoom=13]{ line-width:3.2; }
  [zoom=14]{ line-width:4.6; }
  [zoom=15]{ line-width:6 + 5; }
  [zoom=16]{ line-width:8.5 + 5; }
}
.route.fill[highway='secondary'] {
  [zoom>11]{ line-color:@secondary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@secondary_fill,10); }

  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2.6; }
  [zoom=15]{ line-width:4 + 5; }
  [zoom=16]{ line-width:6 + 5; }
}

/* Primary */
.route.line[highway='primary'][tunnel='no'],
.route.tunnel[highway='primary'] {
  [zoom>6] { line-color:@primary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>6] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  .tunnel[zoom>15]{ line-dasharray:10,2; }

  [zoom=13]{ line-width:3.4; }
  [zoom=14]{ line-width:5; }
  [zoom=15]{ line-width:7 + 5; }
  [zoom=16]{ line-width:9.5 + 5; }
}
.route.fill[highway='primary'] {
  [zoom>10]{ line-color:@primary_fill; line-cap:round; line-join:round; }
  [zoom>10][tunnel='yes'] { line-color:lighten(@primary_fill,10); }
  [zoom=13]{ line-width:1.4; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:5 + 5; }
  [zoom=16]{ line-width:7 + 5; }
}

/* Trunk */
.route.line[highway='trunk'][tunnel='no'],
.route.tunnel[highway='trunk'] {
  [zoom>6] { line-color:@trunk_line; line-cap:round; line-join:round; }
  .tunnel[zoom>6] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  .tunnel[zoom>15]{ line-dasharray:10,2; }
  [zoom=13]{ line-width:1.4 + 2; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:5 + 2; }
  [zoom=16]{ line-width:7 + 2.5; }
}
.route.fill[highway='trunk'] {
  [zoom>10]{ line-color:@trunk_fill; line-cap:round; line-join:round; }
  [zoom>10][tunnel='yes'] { line-color:lighten(@trunk_fill,10); }
  [zoom=13]{ line-width:1.4; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:5; }
  [zoom=16]{ line-width:7; }
}

/* Motorway */
.route.line[highway='motorway'][tunnel='no'],
.route.tunnel[highway='motorway'] {
  [zoom>6] { line-color:@motorway_line; line-cap:round; line-join:round; }
  .tunnel[zoom>6] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  .tunnel[zoom>15]{ line-dasharray:10,2; }
  [zoom=13]{ line-width:2 + 2; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:6 + 2; }
  [zoom=16]{ line-width:8 + 2.5; }
}
.route.fill[highway='motorway'] {
  [zoom>10]{ line-color:@motorway_fill; line-cap:round; line-join:round; }
  [zoom>10][tunnel='yes'] { line-color:lighten(@motorway_fill,10); }
  [zoom=13]{ line-width:2; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:6; }
  [zoom=16]{ line-width:8; }
}

/* ---- TURNING CIRCLES ---- */

.turning-circle[zoom>=14] {
  marker-fill:@road_fill;
  marker-line-color:@road_line;
  marker-line-width:1;
  [zoom=14] { marker-width: 2; }
  [zoom=15] { marker-width: 4; }
  [zoom=16] { marker-width: 7; }
  [zoom=17] { marker-width: 9; }
  [zoom>17] { marker-width: 12; marker-line-width: 1.5; }
}

/* ---- ONE WAY ARROWS ---- */
/* TODO: oneway='-1' */
/* Don't show arrows for service roads (e.g. laneways & roads in parks),
 * because we don't show those roads on the map.
 */
.highway-label::arrow[oneway='yes'][zoom>15][highway!='service'] {
  marker-type:arrow;
  marker-line-width:1;
  marker-line-opacity:0.5;
  marker-line-color:#fff;
  marker-spacing: 300;
  marker-fill:darken(@motorway_line,10);
  marker-opacity:0.8;
  [zoom=16] {
    marker-transform:"scale(0)";
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'] { marker-transform:"scale(0.8)"; }
  }
  [zoom=17] {
    marker-transform:"scale(0.8)";
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'] { marker-transform:"scale(0.9)"; }
  }
  [zoom>17] {
    marker-transform:"scale(1)";
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'] { marker-transform:"scale(1.2)"; }
  }
}

/* ---- AERO ---- */
.aero.poly[zoom>13] {
// Hide the helipad at VGH
//  line-color:lighten(@road_line,5);
//  polygon-fill:lighten(#fff,10);
}

.route.line[aeroway='runway'][zoom>=11],
.route.line[aeroway='taxiway'][zoom>=11] {
  line-cap: square;
  line-color: lighten(@road_line,5);
}
.route.fill[aeroway='runway'][zoom>=12],
.route.fill[aeroway='taxiway'][zoom>=12] {
  line-cap: square;
  line-color: lighten(#fff,10);
}

.route.line[aeroway='runway'] {
  [zoom=11] { line-width: 2; }
  [zoom=12] { line-width: 1 + 2; }
  [zoom=13] { line-width: 3 + 2; }
  [zoom=14] { line-width: 9 + 2; }
  [zoom=15] { line-width: 16 + 2; }
  [zoom=16] { line-width: 22 + 2; }
  [zoom=17] { line-width: 28 + 2; }
  [zoom>17] { line-width: 34 + 2; }
}

.route.fill[aeroway='runway'] {
  [zoom=12] { line-width: 1; }
  [zoom=13] { line-width: 3; }
  [zoom=14] { line-width: 9; }
  [zoom=15] { line-width: 16; }
  [zoom=16] { line-width: 22; }
  [zoom=17] { line-width: 28; }
  [zoom>17] { line-width: 34; }
}

.route.line[aeroway='taxiway'] {
  [zoom=11] { line-width: 1; }
  [zoom=12] { line-width: 0.8 + 1.8; }
  [zoom=13] { line-width: 1 + 2; }
  [zoom=14] { line-width: 2 + 2; }
  [zoom=15] { line-width: 6 + 2; }
  [zoom=16] { line-width: 10 + 2; }
  [zoom=17] { line-width: 10 + 2; }
  [zoom>17] { line-width: 14 + 2; }
}

.route.fill[aeroway='taxiway'] {
  [zoom=12] { line-width: 0.8; }
  [zoom=13] { line-width: 1; }
  [zoom=14] { line-width: 2; }
  [zoom=15] { line-width: 6; }
  [zoom=16] { line-width: 10; }
  [zoom=17] { line-width: 10; }
  [zoom>17] { line-width: 14; }
}

/* ---- PARKING ---- */
/******
No parking. It puts big holes in the zoning colours

.parking[zoom>13] {
  polygon-fill:lighten(@land,3);
  line-color:darken(@land,6);
  [zoom=14] { line-width:0.4; }
  [zoom=15] { line-width:0.6; }
  [zoom>15] { line-width:0.8; }
}
**********/

/* ---- RAILWAYS ---- */
/* TODO: Railway bridges */
.route.fill[railway='rail'][zoom>10] {
  line-color:@rail;
  line-width:0.3;
  line-dasharray:4,3;
  ::x {
    line-color:lighten(@rail,10);
    line-dasharray:0,4,3,0;
    line-width:0.3;
  }
  [zoom=13], ::x[zoom<14] { line-width:0.4; }
  [zoom=14], ::x[zoom=14] { line-width:0.5; }
  [zoom=15], ::x[zoom=15] { line-width:0.6; }
  [zoom=16], ::x[zoom=16] { line-width:0.8; }
  [zoom=17], ::x[zoom=17] { line-width:1.5; }
  [zoom=18], ::x[zoom=18] { line-width:2.0; }
}


/* This gets the data from City of Vancouver sources, which are comprehensive,
 * but don't always line up with OSM sources.
 */
#bikeways {
  line-cap: round;
  line-opacity: 1;

  /* off street */
  [FAC_TYPE="Separated Bikeways"] {
    line-color: @bike_separated;
  }

  /* neighbourhood bikeway */
  [FAC_TYPE="Local Street Bikeways"] {
    line-color: @bike_local;
  }

  /* bike lane */
  [FAC_TYPE="Painted Bike Lanes"] {
    line-color: @bike_lane;
  }

  /* shared roadway */
  [FAC_TYPE="Painted Shared-Use Lanes"] {
    line-color: @bike_shared;
  } 

  [zoom=11]{ line-width:1.0; }
  [zoom=12]{ line-width:1.2; }

  [zoom=13]{ line-width:3; }
  [zoom=14]{ line-width:4; } 
  [zoom=15]{ line-width:7; }
  [zoom=16]{ line-width:9; }


  [zoom=17]{ line-width:10; }
  [zoom>17]{ line-width:20; }
  
} 


/* This gets the data from OSM, which is incomplete: They're missing 10th
 * and other major bikeways.
 */
/***********
.route.line[highway='cycleway'] {
  [zoom>12]{ line-color:@cycleway_line; line-cap:square; line-join:round; }
  [zoom=13]{ line-width:0.2; line-opacity:0.4; }
  [zoom=14]{ line-width:0.4; line-opacity:0.6; }
  [zoom=15]{ line-width:1; line-opacity:0.8; }
  [zoom=16]{ line-width:1.6 + 2; }
  [zoom=17]{ line-width:4 + 2; }
  [zoom>17]{ line-width:7 + 3; }
}
.route.fill[highway='cycleway'] {
  [zoom>15]{ line-color:@cycleway_fill; line-cap:square; line-join:round; }
  [zoom=16]{ line-width:1.6; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:7; }
}
***********/


@trip_fill: rgba(255,127,200,50%);
#trip.BOGUS-HIDE {
  [zoom>=10]{ 
    line-color: @trip_fill; 
    /* line-cap: square gives funny effects when combined with dasharray */
    line-cap: square;
    line-join: round; 
    /*line-dasharray: 6, 3; */
  }

  [zoom=13]{ line-width:2; }
  [zoom=14]{ line-width:8; }
  [zoom=15]{ line-width:9; }
  [zoom=16]{ line-width:4 + 2; }
  [zoom=17]{ line-width:7 + 2; }
  [zoom>17]{ line-width:7 + 3; }
}
