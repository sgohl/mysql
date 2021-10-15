# mysql-slave

2) edit .env file
```
cp .env.example .env
vim .env
```

3) place id_rsa (for ssh access to `MASTER_HOST`)
```
cp /root/.ssh/id_rsa .ssh/
chmod 600 .ssh/id_rsa
```

4) get the default my.cnf from docker image
```
mkdir -p conf
source .env
docker run --rm -v $PWD/conf:/conf $IMAGE sh -c 'cp -fv /etc/my.cnf /conf/'
```

5) edit conf/my.cnf (optional)
```
vim conf/my.cnf
```

6) start replication process (innobackup) (see `/usr/local/bin/repl` in mysql image)
```
bash repl.sh
docker logs -f repl
```

7) finally start mysql server
```
bash run.sh
```




