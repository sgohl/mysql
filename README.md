# MySQL Master-Replication POC

Build a local image
```
VER=5.7
#TEST="true"
docker build --build-arg VER=${VER} --build-arg TEST=${TEST} -t mysql:${VER} server
```

```
docker network create --driver=bridge --attachable=true mysql
```
