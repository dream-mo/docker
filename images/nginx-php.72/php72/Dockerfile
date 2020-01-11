FROM composer as composer_bin
FROM php:7.2-fpm

#安装需要的包
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt-get update -y && apt-get install -y zlib1g-dev

#可能需要添加相应扩展
RUN docker-php-ext-install mysqli bcmath sockets pdo_mysql zip

#安装composer
COPY --from=composer_bin /usr/bin/composer /usr/bin/

#设置composer源信息  将可能多次变动的RUN 命令放到后面利用dockerfile缓存机制
RUN composer config -g repo.packagist composer 'https://mirrors.aliyun.com/composer/'

# php运行环境配置
ADD ./php-conf/php.ini /usr/local/etc/php/conf.d
ADD ./php-conf/www.conf /usr/local/etc/php-fpm.d

# 设置时间
ENV TZ Asia/Shanghai
ENV PATH $PATH:/root/.composer/vendor/bin

ENTRYPOINT php-fpm -R
