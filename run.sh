#!/bin/bash
set -eu

docker-compose -p byomp -f pelias-docker/docker-compose.yml up -d
docker-compose -p byomt -f tileserver-docker/docker-compose.yml up -d
docker-compose -p byomv -f valhalla-docker/docker-compose.yml up -d
docker run -p 5000:5000 --name byom_osrm -d davidlowjw/osrm-backend-docker
docker run --name byom_maputnik -p 8888:8888 -d maputnik/editor
