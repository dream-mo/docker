#### config.json
```

{
    "server": "server_ip",
    "server_port": 2222,
    "method": "aes-256-cfb",
    "password": "pass_word"
}

```

#### 使用privoxy将sockets5流量转http代理

```

yum -y install privoxy

echo 'forward-socks5 / 127.0.0.1:1080 .' >> /etc/privoxy/config

export http_proxy=http://127.0.0.1:8118 # privoxy默认监听端口为8118
export https_proxy=http://127.0.0.1:8118

service privoxy start



curl www.google.com # 就可以访问了

```
