#!/bin/bash
set -eu

rm -rf rawdata

mkdir rawdata
pushd rawdata

mkdir openstreetmap
wget -P openstreetmap https://s3.amazonaws.com/metro-extracts.mapzen.com/singapore.osm.pbf

mkdir openaddresses
wget -P openaddresses $(curl -s http://results.openaddresses.io/?runs=all#runs | grep '/sg/countrywide.zip' | grep -Po '(?<=href=")[^"]*(?=")')

mkdir geonames
wget -P geonames http://download.geonames.org/export/dump/SG.zip

popd
