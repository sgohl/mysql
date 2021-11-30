#!/bin/bash

source .env

docker run -d -it --rm --name repl \
	--env-file .env \
	-v $MYSQLVOL:/var/lib/mysql \
	-v repl:/mysql \
	-v $PWD/.ssh/id_rsa:/root/.ssh/id_rsa:ro \
$IMAGE repl
