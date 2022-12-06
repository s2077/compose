# xxl-job

## introduce

> XXL-JOB是一个分布式任务调度平台，其核心设计目标是开发迅速、学习简单、轻量级、易扩展。

## Quickstart

1. 导入`./sql/tables_xxl_job.sql`文件到xxl_job数据库

2. 修改`./config/application.properties`配置文件, 配置数据库

3. 启动调度器

```bash
docker-compose -f ./prod/xxl-job/docker-compose.yml -f docker-compose.network.yml up -d
```

4. 访问服务: `http://127.0.0.1:8080/xxl-job-admin`, 默认账号: admin, 默认密码: 123456