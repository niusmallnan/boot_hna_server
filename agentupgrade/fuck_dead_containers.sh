#!/bin/bash

#set -ex
ansible all --sudo -m shell -a "docker ps -aq --filter status=dead > ~/dead" -vvvv
ansible all --sudo -m shell -a "cat ~/dead | xargs docker rm -f" -vvvv
