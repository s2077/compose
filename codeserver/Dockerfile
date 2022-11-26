FROM codercom/code-server:latest

LABEL author="s2077"

COPY ./start.sh /opt/start.sh

COPY ./extensions /opt/extensions

USER root

# 替换为国内镜像
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
# 安装常用工具
RUN apt update && apt install -y build-essential cron vim net-tools iputils-ping iproute2 openssh-server python3 python3-pip nodejs npm rsync tree jq zip && \
    # python 工具
    ln -sf /usr/bin/python3 /usr/bin/python && \
    # npm 工具
    npm install --global yarn commitizen git-cz && \
    # 时区
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && \
    # 授权，清理
    chmod +x /usr/local/bin/* && \
    rm -rf /tmp/* && \
    echo "root 用户命令执行完毕..."
