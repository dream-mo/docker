FROM alpine:3.8

LABEL maintainer="dreammo  dreammovip@163.com https://github.com/dream-mo"

RUN apk update && apk add python \
    && apk add py2-pip && pip install shadowsocks

#you can use volume map your config file to /etc/shadowsocks.json, and file name is same
COPY ./shadowsocks.json /etc/shadowsocks.json

#PORTS docker run -P OR docker -p xxxx:8888
EXPOSE 8888

CMD ssserver -c /etc/shadowsocks.json -d start && tail -f /dev/null
