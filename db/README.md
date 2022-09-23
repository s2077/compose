## start service

```bash
# mod env
mv .env.example .env

# start
docker-compose -f ./db/docker-compose.yml -f docker-compose.network.yml --profile mysql --profile redis  up -d

# down
docker-compose -f ./db/docker-compose.yml -f docker-compose.network.yml --profile mysql --profile redis down

# delete data
docker volume rm redis-data mysql-data
```