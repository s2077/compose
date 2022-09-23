## start service

1. create database

```bash
# mysql 创建用户并赋予权限, 请自行替换 nu4x599Wq7u0Bn8EABh3J91G 为自己的密码
mysql -u root -p
create database jumpserver default charset 'utf8';
create user 'jumpserver'@'%' identified by 'nu4x599Wq7u0Bn8EABh3J91G';
grant all on jumpserver.* to 'jumpserver'@'%';
flush privileges;
```

2. env file

```bash
cp .env.example .env
```

3. install mysql and redis(option)

```bash
docker-compose -f ./db/docker-compose.yml -f docker-compose.network.yml --profile mysql --profile redis  up -d
```

4. start

```bash
# init db
docker-compose -f ./jumpserver/docker-compose-init-db.yml -f docker-compose.network.yml up -d
docker exec -i jms_core bash -c './jms upgrade_db'

# start
docker-compose -f ./jumpserver/docker-compose.yml -f docker-compose.network.yml up -d

# end
docker-compose -f ./jumpserver/docker-compose.yml -f docker-compose.network.yml down
```

## reference

1. https://github.com/jumpserver/Dockerfile