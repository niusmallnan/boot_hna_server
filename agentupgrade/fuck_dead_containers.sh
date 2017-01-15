#!/bin/bash
#set -ex

# crontab
# */30 * * * * cd /opt/agent_upgrade && sh get_hosts.sh && sh fuck_dead_containers.sh > /tmp/dead_containers.log 2>&1

ps aux | grep ansible | grep -v 'grep' | awk '{print $2}' | xargs kill -s 9

ansible all --sudo -m shell -a "docker ps -aq --filter status=dead > ~/dead" -vvvv
ansible all --sudo -m shell -a "cat ~/dead | xargs docker rm -f" -vvvv
