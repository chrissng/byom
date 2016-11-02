# Self sufficient maps

A modern map stack so we can all work in a cave and not rely on anyone.
- Singapore data: OSM planet extract, OpenAddresses with postal codes, GeoNames 
- Pelias geocoder
- TileServer GL vector and raster tile server (with custom dark and light styles)
- Valhalla routing engine (turn-by-turn, matrix, isochrones)

## Build

Please ensure you have Docker and Docker Compose installed. Also note that no cache is used when building the docker images for Pelias geocoder and Valhalla routing engine (will take some time to build)

`./build.sh`

## Deploy

`./run.sh`

## Undeploy

`./stop.sh`
