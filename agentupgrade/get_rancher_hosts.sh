#!/bin/bash
set -ex
rm -f all_hosts_ip
rm -f all_hosts_name

for env in `rancher env -a --format {{.ID}}`; do
    for host in `rancher --env $env hosts --format json| jq .Host.hostname| sed 's/\"//g'`; do
        echo "--env ${env} ssh ubuntu@${host}" >> all_hosts_name
    done
    for host in `rancher --env $env hosts --format json| jq .Host.agentIpAddress| sed 's/\"//g'`; do
        echo "${host}" >> all_hosts_ip
    done
done


