#!/bin/bash

docker-compose -p maps -f pelias-docker/docker-compose.yml down
docker-compose -p maps -f tileserver-docker/docker-compose.yml down
docker-compose -p maps -f valhalla-docker/docker-compose.yml down
docker stop maps_osrm
