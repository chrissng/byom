# Bring your own maps

A modern map stack so we can all work in a cave and not rely on anyone.
- Singapore data: OSM planet extract, OpenAddresses with postal codes, GeoNames
- Pelias geocoder (forwards and reverse geocoding, autocomplete)
- TileServer GL vector and raster tile server (with custom dark and light styles)
- Valhalla routing engine (turn-by-turn, matrix, isochrones)
- OSRM routing engine (routing, nearest street segment, map-matching, round trip, etc.)
- Maputnik visual style editor for Mapbox GL

## Requirements

- git
- wget
- Docker engine
- Docker compose

## Build (You probably only need to build once)

Please ensure you have Docker and Docker Compose installed. Also note that no cache is used when building the docker images for Pelias geocoder and Valhalla routing engine (will take some time to build)

```bash
build.sh
```

#### Only build vector tiles, tileserver and editor

```bash
build_tileserver.sh
```

## Rebuild

_Vector tiles builder (OSM2VectorTiles) docker images and volumes are cleaned up to allow for rebuilds._

## Deploy

```bash
start.sh
```

## Undeploy

```bash
stop.sh
```

#### Notes
- Valhalla uses six digits of decimal decision for polyline encoding, OSRM uses five.

#### API usage examples
- Pelias: http://localhost:3100/v1/reverse?point.lat=1.299828&point.lon=103.78927
- Tileserver: http://localhost:8080/styles/light/#17.67/1.30765/103.81606
- Valhalla: http://localhost:8002/route?json={%22locations%22:[{%22lat%22:1.299828,%22lon%22:103.78927},{%22lat%22:1.366524,%22lon%22:103.838249}],%22costing%22:%22auto%22}
- OSRM: http://localhost:5000/route/v1/asd/103.78927,1.299828;103.838249,1.366524
- Maputnik: http://localhost:8888/ (and upload JSON style sheet, e.g. http://localhost:8080/styles/dark.json)
