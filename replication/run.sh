#!/bin/bash

source .env

docker run -d --restart=always --name mysql \
	-v $MYSQLVOL:/var/lib/mysql \
	-v $PWD/conf/my.cnf:/etc/my.cnf \
	${NETWORK_MODE} \
$IMAGE
