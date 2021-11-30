# MySQL Master-Replication POC

Build a local image
```
VER=5.7
docker build --build-arg VER=$VER --build-arg TEST=true -t mysql:$VER server
```

see replication/Readme.md
