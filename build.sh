#!/bin/bash


# Clone all the required git repos
git clone \
  --branch=master \
  https://github.com/datagovsg/pelias-docker.git
git clone \
  --branch=master \
  https://github.com/datagovsg/tileserver-docker.git
git clone \
  --branch=master \
  https://github.com/osm2vectortiles/osm2vectortiles.git
git clone \
  --branch=master \
  https://github.com/datagovsg/valhalla-docker.git


# Pelias geocoder
pushd pelias-docker
docker-compose -p pelias up --build -d elasticsearch
docker-compose build --force-rm --no-cache pelias
docker-compose -p pelias down
popd


# TileServer-GL vector and raster tile server
pushd osm2vectortiles
docker-compose up -d postgis
wget -P import https://s3.amazonaws.com/metro-extracts.mapzen.com/singapore.osm.pbf
docker-compose run import-external
docker-compose run import-osm
docker-compose run import-sql
docker-compose run \
  -e BBOX="103.062, 0.807, 104.545, 1.823" \
  -e MIN_ZOOM="0" \
  -e MAX_ZOOM="22" \
  export
docker-compose down
popd
pushd tileserver-docker
cp ../osm2vectortiles/export/tiles.mbtiles export
popd


# Valhalla routing engine
pushd valhalla-docker
./build.sh
popd
