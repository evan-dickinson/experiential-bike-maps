/* ---- BACKGROUNDS ---- */
@water: hsl(220, 82%, 81% + 5%);
@land:      #f4f6f0;
@park: hsl(101, 73% - 10%, 83% + 5%);
@grass: @park;
@forest: darken(@park, 5);

@agriculture:#f4f0e0;
@beach:     #ffeec7;
@building:  darken(#e8e4e4,8);

/* ---- ROADS ---- */
/* This is the colour for the Trans-Canada highway and the bridges across
 * the Fraser river.
 */
@motorway_fill: hsl(0, 0%, 65%);
@motorway_line: spin(darken(@motorway_fill,25),-10);

/* Is this unused? Evan doesn't see any examples of it. */
/* Was: #b2ad70; (also used as primary_fill and secondary_fill) */
@trunk_fill:    #a7dea5;/*#fabd7d;*/
@trunk_line:    spin(darken(@trunk_fill,25),-10);

/* Kingsway, E Hastings, Broadway (E of Granville), Granville, W Georgia, 
 * Stanley Park Causeway. 
 */
@primary_fill:   rgb(194, 201, 193);
@primary_line:   spin(darken(@primary_fill,25),-10);

/* Pacific, Burrard, 4th, Powell, Clark, Nanaimo, Cambie, King Ed, etc. */
@secondary_fill: @primary_fill;
@secondary_line: spin(darken(@secondary_fill,25),-10);

/* Smaller roads */
@road_fill:     rgb(254, 254, 254);
@road_line:     @road_fill;

@access_fill:   @road_fill;
@access_line:   @road_line;
@track:         @road;
@footway:       #6B9;
@cycleway:      hsl(128, 100%, 35%);

@cycleway_fill: #69B;
@cycleway_line: spin(darken(@cycleway_fill,25),-10);

@bridge:        rgba(64,64,64,0.66); 
@rail:          #999;



/* ---- ROUTE LINES ---- */
/* used by b-route-line-* projects */
@b-route-line-opacity: 0.5;
@b-route-line-selected-color:   rgb(128, 29, 127);
@b-route-line-deselected-color: rgb(128, 108, 144);

/* 1.5x wider than the widths for the bikway lines */
@b-route-line-width-z13: 3 * 2.75;
@b-route-line-width-z14: 4 * 2.75;
@b-route-line-width-z15: 7 * 2.75;
@b-route-line-width-z16: 9 * 2.75;


/* ---- BIKEWAYS ---- */
@bike_separated: hsl(133, 47%, 25%);
@bike_local:     hsl(115, 58%, 44%);
@bike_lane:      rgb(0, 93, 170);
@bike_shared:    rgb(0, 149, 184);

/* ---- ZONING ---- */
@residential: hsl(45,  44%, 90%);
@retail:      hsl(270, 74%, 89%);
@industrial:  hsl(237, 62%, 88%);
