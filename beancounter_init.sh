#!/bin/bash
#set -ex

read -p "Enter Rancher url: " RANCHER_URL
RANCHER_URL=${RANCHER_URL:-http://localhost:8082}

read -p "Enter Admin key: " USER_KEY

read -p "Enter Admin secret:" USER_PASS

read -p "Enter Beancounter service name: " SERVICE_KEY
SERVICE_KEY=${SERVICE_KEY:-service0}

read -p "Enter Beancounter service pass: " SERVICE_PASS
SERVICE_PASS=${SERVICE_PASS:-service0pass}

RANCHER_URL=${RANCHER_URL} \
    USER_KEY=${USER_KEY} \
    USER_PASS=${USER_PASS} \
    SERVICE_KEY=${SERVICE_KEY} \
    SERVICE_PASS=${SERVICE_PASS} \
    ./scripts/create-service-account.sh
