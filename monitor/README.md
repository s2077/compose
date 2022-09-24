# quick start

1. start all monitor service

```bash
docker-compose -f ./monitor/docker-compose.yml -f docker-compose.network.yml --profile prometheus  up -d
```


# install loki driver

1. install loki driver

```bash
# install
docker plugin install grafana/loki-driver:latest --alias loki --grant-all-permissions

# restart docker
sudo systemctl restart docker
```


2. docker log config
```bash
cat <<EOF > /etc/docker/daemon.json
{
    "live-restore": true,
    "log-driver": "loki",
    "log-opts": {
        "loki-url": "http://localhost:3100/loki/api/v1/push",
        "loki-external-labels": "instance=sm-instance",
        "max-size": "50m",
        "max-file": "10"        
    }
}
EOF
```

3. compose log config

```bash
...
services:
  hello-world:
    image: kerwood/hello-world
    logging:
      driver: loki
      options:
        loki-url: "http://localhost:3100/loki/api/v1/push"
    ...
```

4. docker command log config

```bash
docker run --name hello-world \
  --log-driver=loki \
  --log-opt loki-url="http://localhost:3100/loki/api/v1/push" \
  -p 3000:3000 \
  -d kerwood/hello-word
```

# Reference

1. https://github.com/boTux-fr/docker-compose-loki
2. https://grafana.com/docs/grafana/latest/datasources/loki/
3. https://github.com/soulteary/Home-Network-Note/tree/master/example/monitor
4. https://linuxblog.xyz/posts/grafana-loki/