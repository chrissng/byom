#!/bin/bash
set -xeu


# Clone all the required git repos
set +e
git clone \
  --branch=master \
  https://github.com/chrissng/tileserver-docker.git
git clone \
  --branch=master \
  https://github.com/chrissng/osm2vectortiles.git
git clone \
  --branch=master \
  https://github.com/maputnik/editor.git
set -e


# TileServer-GL vector and raster tile server
pushd osm2vectortiles
git pull

## Clean images and volumes, refresh images
docker-compose down -v --remove-orphans
docker-compose rm -fv
docker volume ls -q | grep osm2vectortiles | xargs -r docker volume rm || true

docker-compose up -d postgis
rm -f export/tiles.mbtiles
rm -f import/singapore.osm.pbf
wget -P import https://s3.amazonaws.com/metro-extracts.mapzen.com/singapore.osm.pbf
docker-compose run import-external
docker-compose run import-osm
docker-compose run import-sql
docker-compose run \
  -e BBOX="103.062, 0.807, 104.545, 1.823" \
  -e MIN_ZOOM="0" \
  -e MAX_ZOOM="22" \
  export
docker-compose down -v --remove-orphans
popd
pushd tileserver-docker
git pull
cp ../osm2vectortiles/export/tiles.mbtiles export
popd


# Mapbox GL style editor
pushd editor
#git reset --hard d62575b9651fa7e132500f62684d7ecd9f326916
git pull
docker build -t maputnik/editor .
popd
