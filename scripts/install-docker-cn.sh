#!/bin/bash

# author @s2077
# date 2022-09-24
# reference https://github.com/soulteary/Home-Network-Note/blob/master/scripts/install-docker-cn.sh

function install_docker(){
  echo "start install docker"
  sudo apt-get remove docker docker-engine docker.io containerd runc

  # install dependencies
  sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

  # add repo
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # install docker-ce
  sudo apt-get update
  sudo apt-get install docker-ce
  sudo systemctl enable docker.service
  sudo systemctl start docker.service
  echo "docker install success"
}


function install_compose_from_daocloud(){
  echo "start install docker-compose"
  COMPOSE_VERSION=2.11.1
  curl -L https://get.daocloud.io/docker/compose/releases/download/v${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
  sudo mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "start docker-compose success"
}

function config_registry_mirrors(){
  # docker registry-mirrors
  # mkdir -p /etc/docker && touch /etc/docker/daemon.json
  # cat <<EOF > /etc/docker/daemon.json
  # {
  #     "registry-mirrors":  [
  #       "https://hub-mirror.c.163.com",
  #       "https://docker.mirrors.ustc.edu.cn",
  #       "https://reg-mirror.qiniu.com",
  #       "https://registry.docker-cn.com"
  #   ]
  # }
  # EOF
  curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
  sudo systemctl restart docker.service
}


NAME=$1

if [ $NAME = "docker" ]; then
  install_docker
  config_registry_mirrors
elif [ $NAME = "compose" ]; then
  install_compose_from_daocloud
elif [ $NAME = "mirror" ]; then
  config_registry_mirrors
else
  install_docker
  install_compose_from_daocloud
  config_registry_mirrors
fi