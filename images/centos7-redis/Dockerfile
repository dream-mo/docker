FROM centos:7

RUN yum update -y && yum install gcc make autoconf -y && mkdir /data

WORKDIR /data

RUN cd /data && curl -o redis.tar.gz -s http://download.redis.io/releases/redis-5.0.5.tar.gz && tar -zxvf redis.tar.gz \
    && cp redis-5.0.5/redis.conf ./ &&  cd redis-5.0.5/src/ && make MALLOC=libc && make install && rm -rf /data/redis-5.0.5 \
    && rm -rf /data/redis.tar.gz

EXPOSE 6379

CMD tail -f /dev/null
