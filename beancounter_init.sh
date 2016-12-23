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

./scripts/create-service-account.sh
