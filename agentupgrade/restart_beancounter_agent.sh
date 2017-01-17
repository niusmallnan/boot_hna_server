#!/bin/bash

#set -ex

for env in `rancher env -a --format {{.ID}}`; do
    bc_service_id=''
    for d in `rancher --env ${env} ps -s | grep beancounter-agent`; do
        bc_service_id=$d
        break
    done
    if [ ! -z "$bc_service_id"  ]; then
        echo "env: $env, beancounter service: $bc_service_id"
        rancher restart $bc_service_id
    fi
done
