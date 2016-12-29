#!/bin/bash

#set -ex

IMG_LIST="rancher/network-manager:v0.2.19
          rancher/dns:v0.11.0"

for img in $IMG_LIST; do
    docker pull $img
    docker save $img -o images/$img.tar
done


