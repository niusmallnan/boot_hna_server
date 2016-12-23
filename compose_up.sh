#!/bin/bash
set -ex

node=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'` \
xmx=28672m
influxdb=xxxxx
docker-compose up -d
