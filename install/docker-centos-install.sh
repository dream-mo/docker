#!/bin/bash

yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum-config-manager --enable docker-ce-edge

yum-config-manager --enable docker-ce-test

yum-config-manager --disable docker-ce-edge

yum update -y

yum install -y docker-ce

mkdir -p /etc/docker/

touch /etc/docker/daemon.json

echo {'"registry-mirrors"': ['"http://f1361db2.m.daocloud.io"']} > /etc/docker/daemon.json #加入国内daocloud镜像加速地址

systemctl docker restart

systemctl enable docker

echo -e "install success"

docker version # 查看docker版本
