# mysql-replication

1) edit .env file
```
cp .env.example .env
vim .env
source .env
```

2) get my.cnf from docker image
```
docker run --rm -v $PWD/conf:/conf $IMAGE sh -c 'cp -fv /etc/my.cnf /conf/'
```

3) place id_rsa (for ssh access to `MASTER_HOST`)
ignore for local replication
```
cp /root/.ssh/id_rsa .ssh/
chmod 600 .ssh/id_rsa
```

4) start replication (innobackup) (see `/usr/local/bin/repl` in mysql image)
```
bash repl.sh
docker logs -f repl
```

5) finally start mysql replication server
```
bash run.sh
```




