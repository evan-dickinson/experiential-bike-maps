## Introduction ##

This is the source code that goes along with my [thesis][thesis]. There are four
prototypes of trip planners for bike routes; they show the experience of a trip
as well as the trip.

There has been very minimal code cleanup before creating this repo. It  
won't run out of the box. 

## Map Design ##

The maps themselves are created with [TileMill][tilemill]. The visual style
is based upon [open-streets-style][open-streets-style]. 

There are 4 prototype: 2 different visual styles (A and B) and two different
trips (to-cedar and to-kits). Each prototype gets a set of TileMill projects.
Why a set of projects? Because there are map layers, not from TileMill,
 sandwiched between the layers TileMill did create. Here's an example:

The prototypes have two different visual styles (A and B); so there's one 
set of TileMill projects for A and another for B. Why have sets of projects?
Because there are map layers, not from TileMill, sandwiched between the layers
TileMill did create. Here's how they work together:

* `a-only-labels`: The top layer of the map is for text: street names & city names
* `a-no-labels`: Everything that's not the labels; the map's base layer
* `a-base`: A master project that includes both labels and the base layer. The stylesheets in the other projects are symlinks to this one: edit this and they both update.

`open-streets-style` assumes that you've set up a database with OpenStreetMap data
for Vancouver, BC. See `README-open-streets-style.md` for instructions on how to 
configure this to connect to your database.

## Web App ##
The web application is HTML + JavaScript, assembled with [Jekyll][jekyll]. 
It also uses [sass](http://sass-lang.com), [haml](http://haml.info),
and various other tools (in `jekyll/source/contrib`).

Everything for the web app lives in the `jekyll` directory.

## Map Data ##
The TileMill projects contain references to map data that aren't in this repository.
Most of them are from the [City of Vancouver][cov]. Other files you'll need
are [shoreline_300.zip][shoreline_300] and [processed_p.zip][processed_p].

There is other map data information in the `jekyll/source/data` directory. This is
(a) datasets I made, (b) datasets from the City of Vancouver that I edited, and
(c) elevation data from GeoBase &reg;.

## Photographs ##
[Molson Brewery][molson] by Todd Van Hossear, [CC-BY-SA][cc-by-sa].
[North False Creek Seawall][seawall] by Kyle Pearce, [CC-BY-SA][cc-by-sa].
All other photographs by Evan Dickinson.

[molson]: http://www.flickr.com/photos/vanhoosear/3397946330/in/photostream/
[seawall]: http://www.flickr.com/photos/keepitsurreal/2383921256/
[cc-by-sa]: http://creativecommons.org/licenses/by-sa/3.0/

[thesis]: http://evand.name/thesis
[tilemill]: http://tilemill.com/
[open-streets-style]: https://github.com/mapbox/open-streets-style
[jekyll]: http://jekyllrb.com
[cov]: http://data.vancouver.ca/datacatalogue/index.htm
[shoreline_300]: http://tilemill-data.s3.amazonaws.com/osm/shoreline_300.zip
[processed_p]: http://tilemill-data.s3.amazonaws.com/osm/processed_p.zip
