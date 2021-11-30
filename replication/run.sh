#!/bin/bash

source .env

docker run -d --restart=always --name mysql \
	-v repl:/var/lib/mysql \
	-v $PWD/my.cnf:/etc/my.cnf \
	${NETWORK_MODE} \
$IMAGE
