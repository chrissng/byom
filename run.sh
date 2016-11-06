#!/bin/bash
set -eu

docker-compose -p maps -f pelias-docker/docker-compose.yml up -d
docker-compose -p maps -f tileserver-docker/docker-compose.yml up -d
docker-compose -p maps -f valhalla-docker/docker-compose.yml up -d
docker run -p 5000:5000 davidlowjw/osrm-backend-docker
