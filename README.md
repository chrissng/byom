# Self sufficient maps

A modern map stack so we can all work in a cave and not rely on anyone.

## Build

Please ensure you have Docker and Docker Compose installed.

`./build.sh`

## Deploy

`docker-compose -p maps -f pelias-docker/docker-compose.yml -f tileserver-docker/docker-compose.yml -f docker-compose.yml up --build -d`
