#
# Mysql Dockerfile
#
# https://github.com/ibbd/dockerfile-mariadb
#
# sudo docker build -t ibbd/mariadb ./
#
# 没安装mycli之前302M, 安装完之后是351.6M
#

# Pull base image.
FROM mariadb:10.2

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# Define mountable directories.
VOLUME ["/var/lib/mysql"]

# mycli 
RUN \
    buildDeps='apt-transport-https build-essential git curl' \
    && set -x \
    && apt-get update \
    && apt-get install -y $buildDeps \
    && echo "deb https://packagecloud.io/amjith/mycli/ubuntu/ trusty main" | tee -a /etc/apt/sources.list \
    && curl https://packagecloud.io/gpg.key | apt-key add - \
    && apt-get update \
    && apt-get install -y mycli \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && rm -r /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove $buildDeps 

# Define working directory.
WORKDIR /etc/mysql

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm

# Expose ports.
EXPOSE 3306

