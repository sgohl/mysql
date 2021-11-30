# MySQL Master-Replication POC

##### Customize `.env`
```
cp .env.example .env
vim .env
```

##### Requirements (`external: true`)
```
docker volume create mysql
docker volume create repl
docker network create --driver=bridge --attachable=true mysql
```

##### Build MySQL Image
```
docker-compose build mysql
```
