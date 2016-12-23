

docker run -d --restart=unless-stopped \
	-e CATTLE_URL=http://internal-hna-caas-product-rancher-lb-1754718600.cn-north-1.elb.amazonaws.com.cn:8082
	-e CATTLE_ACCESS_KEY=service0
	-e CATTLE_SECRET_KEY=service0pass
	--add-host influxdb:xxxxxxx
	--add-host postgres:hna-caas-product-postgresql.cc8fqrm5ebkq.rds.cn-north-1.amazonaws.com.cn
	imikushin/beancounter:v0.3.8 \
	beancounter server

