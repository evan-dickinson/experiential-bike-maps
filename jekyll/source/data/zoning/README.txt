City of Vancouver zoning data. Retrieved from data.vancouver.ca.

http://data.vancouver.ca/termsOfUse.htm

Instructions for cleaning the shapefile
=======================================
1. ogr2ogr -f "ESRI Shapefile" zoning-districts-clipped-2.shp
   zoning-districts-clipped.shp

2. Delete zoning-districts-clipped.*

3. Rename zoning-districts-clipped-2.* to zoning-districts-clipped.*


Instructions for clipping the zoning districts
==============================================

1. You need to ensure that both maps have the same projection:
  * Open a layer in QGIS
  * Right-click and do Save As
  * Set the projection to Google Mercator
  * Repeat with the other layer

2. Close the original layers. Open the layers you made in step 1.

3. Use Vector > Geoprocessing Tools > Intersect.


