FROM centos:7.6.1810
#https://id.signalwire.com/ 注册一个账号并且创建token
ARG user
ARG token
#默认1.10.8版本
ARG version=1.10.8
RUN echo $user > /etc/yum/vars/signalwireusername \
    && echo $token > /etc/yum/vars/signalwiretoken \
    && yum install -y https://$(< /etc/yum/vars/signalwireusername):$(< /etc/yum/vars/signalwiretoken)@freeswitch.signalwire.com/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm   epel-release
RUN yum install yum-plugin-versionlock -y && yum search 'freeswitch' | cut -d ":" -f 1 | grep 'freeswitch' | grep '.x86_64' | cut -d "." -f 1 | xargs -I {} -t yum versionlock add {}-$version.release.14-1.el7
RUN yum install -y freeswitch-config-vanilla freeswitch-database-mariadb
#可以安装自己的module, 例如 yum install freeswitch-xx
RUN yum clean all && find /var/log -type f -delete && rm -rf /tmp/*
ENTRYPOINT ["freeswitch"]
