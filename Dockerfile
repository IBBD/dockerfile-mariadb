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

# Define working directory.
WORKDIR /etc/mysql

# 解决时区问题
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm

# Expose ports.
EXPOSE 3306

