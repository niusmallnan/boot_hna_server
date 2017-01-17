#!/bin/bash
set -ex
rm -f all_hosts_ip
rm -f all_hosts_name

RANCHER="/usr/local/bin/rancher"

for env in `$RANCHER env -a --format {{.ID}}`; do
    for host in `$RANCHER --env $env hosts --format json| jq .Host.hostname| sed 's/\"//g'`; do
        echo "--env ${env} ssh ubuntu@${host}" >> all_hosts_name
    done
    for host in `$RANCHER --env $env hosts --format json| jq .Host.agentIpAddress| sed 's/\"//g'`; do
        echo "${host}" >> all_hosts_ip
    done
done


