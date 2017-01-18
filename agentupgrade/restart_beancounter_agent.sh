#!/bin/bash

#set -ex

RANCHER="/usr/local/bin/rancher"

for env in `$RANCHER env -a --format {{.ID}}`; do
    bc_service_id=''
    for d in `$RANCHER --env ${env} ps -s | grep beancounter-agent`; do
        bc_service_id=$d
        break
    done
    if [ ! -z "$bc_service_id"  ]; then
        echo "env: $env, beancounter service: $bc_service_id"
        $RANCHER --env ${env} restart $bc_service_id
    fi
done
