#!/bin/bash

docker-compose -p byomp -f pelias-docker/docker-compose.yml down
docker-compose -p byomt -f tileserver-docker/docker-compose.yml down
docker-compose -p byomv -f valhalla-docker/docker-compose.yml down
docker stop byom_osrm && docker rm byom_osrm
docker stop byom_maputnik && docker rm byom_maputnik
