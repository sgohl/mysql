#!/bin/bash

source .env

docker run -d --restart=always --name mysql \
	-v $MYSQLVOL:/var/lib/mysql \
	-v $PWD/dist/etc/my.cnf-${VER}:/etc/my.cnf \
	${NETWORK_MODE} \
$IMAGE
