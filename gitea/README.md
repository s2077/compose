# quick start 

1. start mysql service

```bash
# start
docker-compose -f ./db/docker-compose.yml -f docker-compose.network.yml --profile mysql  up -d
```

2. create database


3. create systemd unit

3.1 Copy docker-gitea.service.dist to docker-gitea.service
3.2 Adjust WorkingDirectory in service file if needed
3.3 Create symbolic link: ln -s docker-gitea.service /etc/systemd/system/docker-gitea.service
3.4 Start service: systemctl start docker-gitea
3.5 (optional) Enable autostart at boot: systemctl enable docker-gitea
