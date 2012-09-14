/* ---- BACKGROUNDS ---- */
@water:     hsl(217, 50%, 88%);
//@land:      hsl(40, 25%, 95%);
//@building:  hsl(40, 45%, 95%);

@land:      hsl(89, 13%, 90%);
@building:  hsl(89, 20%, 75%);

@forest:    #c7e6a8;
@agriculture:#f4f0e0;
@grass:     lighten(@forest,5);
@park:      hsl(89, 54%, 88%);
@beach:     #ffeec7;

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
//@primary_fill:   hsl(226, 10%, 85%);
@primary_fill:   rgb(254, 254, 254);
@primary_line:   spin(darken(@primary_fill,25),-10);

/* Pacific, Burrard, 4th, Powell, Clark, Nanaimo, Cambie, King Ed, etc. */
@secondary_fill: @primary_fill;
@secondary_line: spin(darken(@secondary_fill,25),-10);

/* Smaller roads */
//@road_fill:     hsl(226, 10%, 90%);
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

/* ---- BIKEWAYS ---- */
@bike_separated: hsl(133, 47%, 25%);
@bike_local:     hsl(115, 58%, 44%);
@bike_lane:      rgb(0, 93, 170);
@bike_shared:    rgb(0, 149, 184);

