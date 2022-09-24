# quick start


```bash
docker-compose -f ./monitor/docker-compose.yml -f docker-compose.network.yml --profile prometheus  up -d
```

promtail config, push log to loki server


# install loki driver

1. install loki driver

```bash
# install
docker plugin install grafana/loki-driver:latest --alias loki --grant-all-permissions

# docker log config
cat <<EOF > /etc/docker/daemon.json
{
    "live-restore": true,
    "log-driver": "loki",
    "log-opts": {
        "loki-url": "http://<loki-server-addr>,
        "loki-external-labels": "instance=sm-instance",
        "max-size": "50m",
        "max-file": "10"        
    }
}
EOF


# restart docker
sudo systemctl restart docker
```

# Reference

1. https://github.com/boTux-fr/docker-compose-loki
2. https://grafana.com/docs/grafana/latest/datasources/loki/