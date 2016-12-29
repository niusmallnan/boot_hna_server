#!/bin/bash

#set -ex

for image in `ls /opt/agent_upgrade/images`; do
    echo $image
    ansible all -m copy -a "src=/opt/agent_upgrade/images/${image} dest=~/"
    ansible all --sudo -m shell -a "docker load -i /home/ubuntu/${image}" -vvv
done
