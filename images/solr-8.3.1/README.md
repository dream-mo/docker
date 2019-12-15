## 简介

   此镜像是基于solr官方镜像加入了IK分词器以及mysql dataimport的jar包默认配置文件模板等等。
只需要在容器内执行  solr_create_core  core_name  命令即可创建一个core_name的core，默认创建一个text_ik的
FiledType。 便于我们直接使用solr+ik分词器，不用从头搭建运行环境。
   
   ik分词器:   https://repo1.maven.org/maven2/com/github/magese/ik-analyzer/8.3.0/ik-analyzer-8.3.0.jar
   
   mysql JDBC驱动:  https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar
   (mysql驱动需要注意,选择mysql版本选择对应自己使用的mysql server版本驱动包，否则有可能导入数据失败)

  Dockerfile源码github地址:  https://github.com/dream-mo/docker/tree/master/images/solr-8.3.1
   
   
## 运行

 简单运行:  ``` docker run -d -p 8983:8983 dreammo/solr::8.3.1-ik ```
 
 挂载自己的数据卷: ```docker run -d -p 8983:8983 -v $PWD:/var/solr dreammo/solr::8.3.1-ik```
 
 挂载ik分词器配置: ``docker run -d -p 8983:8983 -v $IK_CONFIG_DIR:/opt/solr-8.3.1/server/solr-webapp/webapp/WEB-INF/classes/ dreammo/solr::8.3.1-ik```
 (备注: 修改ik分词器配置如.dic字典文件以及ik分词器配置的xlm文件  需要重启容器后生效)
 
 创建自己的core:
 
 ```shell script
 docker exec -it container-name /bin/bash
 
 solr_create_core my_core
```
