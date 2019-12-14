# 构建基于solr的版本号
ARG VERSION=8.3.1
FROM solr:${VERSION}

# 维护者信息
MAINTAINER dreammo dreammovip@163.com

# 环境变量定义
ENV SOLR_VERSION 8.3.1
ENV SOLR_WEBAPP_LIB /opt/solr-${SOLR_VERSION}/server/solr-webapp/webapp/WEB-INF/lib/
ENV SOLR_DATA_DIR /var/solr/data

# 准备模板jar包以及配置文件
USER root
RUN mkdir -p /opt/solr-${SOLR_VERSION}/ik-mysql-template/ && cd /opt/solr-${SOLR_VERSION}/ik-mysql-template/ && \
   mkdir lib && cd lib && wget -q 'https://repo1.maven.org/maven2/com/github/magese/ik-analyzer/8.3.0/ik-analyzer-8.3.0.jar' \
   && wget -q 'https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar' \
   && cp /opt/solr-${SOLR_VERSION}/dist/solr-dataimporthandler-${SOLR_VERSION}.jar /opt/solr-${SOLR_VERSION}/dist/solr-dataimporthandler-extras-${SOLR_VERSION}.jar ./

# 拷贝命令并赋予执行权限
COPY solr_create_core /usr/bin/
RUN chmod +x /usr/bin/solr_create_core && cp /opt/solr-${SOLR_VERSION}/ik-mysql-template/lib/*.jar ${SOLR_WEBAPP_LIB}

# 拷贝默认配置文件
COPY  data-config.xml /opt/solr-${SOLR_VERSION}/ik-mysql-template/
COPY  managed-schema /opt/solr-${SOLR_VERSION}/ik-mysql-template/
COPY  solrconfig.xml /opt/solr-${SOLR_VERSION}/ik-mysql-template/

# 切换默认USER solr
USER solr


