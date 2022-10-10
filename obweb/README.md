# quick start

1. build images
```bash
docker login
docker build -t s2077/obweb:v1.0.0 .
docker push s2077/obweb:v1.0.0
```

2. start service
```bash
docker-compose -f ./obweb/docker-compose.yml -f docker-compose.network.yml up -d
```

index page: http://localhost:8007/front/index.html
```


# Reference
1. https://github.com/chenyukang/obweb
2. https://catcoding.me/p/intro-to-obweb/