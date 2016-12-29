#!/bin/bash
set -ex

docker run -d --restart=unless-stopped \
    -p 3000:3000 \
    --name beancounter-server \
    -e INFLUXDB_HOST=192.168.99.100 \
    -e POSTGRES_HOST=192.168.99.100 \
    -e CATTLE_URL=http://192.168.99.1:8080 \
    -e CATTLE_ACCESS_KEY=service0 \
    -e CATTLE_SECRET_KEY=service0pass \
    --add-host influxdb:192.168.99.100 \
    --add-host postgres:192.168.99.100 \
    imikushin/beancounter:v0.3.9 \
    beancounter server

