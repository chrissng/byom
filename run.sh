#!/bin/bash
set -eu

docker-compose -p byomp -f pelias-docker/docker-compose.yml up -d
docker-compose -p byomt -f tileserver-docker/docker-compose.yml up -d
docker-compose -p byomv -f valhalla-docker/docker-compose.yml up -d
docker run --name byom_osrm -p 5000:5000 --restart always -d davidlowjw/osrm-backend-docker
docker run --name byom_maputnik -p 8888:8888 --restart always -d maputnik/editor
