//@font_reg: "Ubuntu Regular","Arial Regular","DejaVu Sans Book";
@font_reg:  "Arial Bold";
//@font_reg: "DejaVu Sans Book";

/* ---- PLACENAMES ---- */

.placename.medium[place='city'][zoom>6][zoom<14],
.placename.medium[place='metropolis'][zoom>6][zoom<14] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#555;
  text-halo-fill:#fff;
  text-halo-radius:2;
  [zoom=7] { text-size:10; text-halo-radius:1; }
  [zoom=8] { text-size:10; text-halo-radius:1; }
  [zoom=9] { text-size:11; }
  [zoom=10] { text-size:12; }
  [zoom=10] { text-size:13; text-character-spacing:1; }
  [zoom=11] { text-size:14; text-character-spacing:2; }
  [zoom=12] { text-size:16; text-character-spacing:4; }
  [zoom=13] { text-size:18; text-character-spacing:6; }
}

.placename.medium[place='large_town'][zoom>7][zoom<16],
.placename.medium[place='town'][zoom>8][zoom<16],
.placename.medium[place='small_town'][zoom>9][zoom<16]{
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#555;
  text-halo-fill:#fff;
  text-halo-radius:2;
  [zoom=8] { text-size:10; text-halo-radius:1; }
  [zoom=9] { text-size:10; text-halo-radius:1; }
  [zoom=10] { text-size:10; text-halo-radius:1; }
  [zoom=11] { text-size:11; }
  [zoom=12] { text-size:12; }
  [zoom=13] { text-size:13; text-character-spacing:1; }
  [zoom=14] { text-size:14; text-character-spacing:2; }
  [zoom=15] { text-size:16; text-character-spacing:4; }
  [zoom=16] { text-size:18; text-character-spacing:6; }
}

/* ---- HIGHWAY ---- */

@motorway_text_fill:  spin(darken(@motorway_fill,70),-15);
@trunk_text_fill:     spin(darken(@trunk_fill,66),-15);
// Old colours, from before I removed the halos.
//
// @primary_text_fill:   spin(darken(@primary_fill,66),-15);
// @secomdary_text_fill: spin(darken(@secondary_fill,66),-15);
// @road_text_fill: #444;

@primary_text_fill:   hsl(220, 2%, 35%);
@secondary_text_fill: @primary_text_fill;
@road_text_fill:      @primary_text_fill;

.highway-label[zoom>11] {
  text-face-name:@font_reg;
  text-halo-radius:1.5;
  text-placement:line;
  text-name:"''";
  text-fill: #333;
  text-halo-fill: @road_fill;

  text-min-distance: 8;
  text-min-padding: 8;

  [zoom>=13] {
    /* trans-canada highway, bridges, Kingsway, Granville,
     * Stanley Park Causeway
     */
    [highway='motorway'],[highway='trunk'],[highway='primary'] {
      text-name:"[name]";
      text-size: 13;      
      [zoom>=15] { text-size: 15; }
    }
  }

  /* Pacific, Burrard, 4th, Powell, Clark, Nanaimo, Cambie, King Ed, etc. */
  [highway='secondary'][zoom>=13] {
    text-name:"[name]";
    text-size: 11;
    [zoom>=15] { text-size: 13; }
  }
  [highway='residential'][zoom>=15],
  [highway='road'][zoom>=15],
  [highway='tertiary'][zoom>=15],
  [highway='unclassified'][zoom>=15] {
    text-name:"[name]";
    text-size: 11;
  }
}


