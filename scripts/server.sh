#!/bin/bash
set -ex

docker run -d --restart=unless-stopped \
	-e DEFAULT_CATTLE_CATALOG_URL=library=https://github.com/niusmallnan/rancher-catalog.git \
	-e JAVA_OPTS="-Xmx28672m" \
	-p 8082:8080 -p 9345:9345 --name hna-server \
	alena1108/rancher:envlinks-v1 \
	--db-host hna-caas-product-mysql.cc8fqrm5ebkq.rds.cn-north-1.amazonaws.com.cn \
	--db-port 3306  --db-user hnacaas --db-pass hnacloudos \
	--advertise-address `ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'` \
    --advertise-http-port 8082
