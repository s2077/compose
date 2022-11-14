## 错误提示

### docker部署rancher

部署命令:
```bash
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:stable
```
错误提示:
```shell
ERROR: Rancher must be ran with the --privileged flag when running outside of Kubernetes
```

修改后的命令:
```bash
sudo docker run --privileged -d --restart=unless-stopped -p 8010:80 -p 8011:443 --name rancher rancher/rancher:stable
```
