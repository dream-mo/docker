##简介

   此镜像是基于solr官方镜像加入了IK分词器以及mysql dataimport的jar包默认配置文件模板等等。
只需要在容器内执行  solr_create_core  core_name  命令即可创建一个core_name的core，默认创建一个text_ik的
FiledType。
   
   ik分词器:   https://repo1.maven.org/maven2/com/github/magese/ik-analyzer/8.3.0/ik-analyzer-8.3.0.jar
   
   mysql JDBC驱动:  https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar
   (mysql驱动需要注意,选择mysql版本选择对应自己使用的mysql server版本驱动包，否则有可能导入数据失败)
   
   
## 运行

 简单运行:  ``` docker run -d -p 8983:8983 dreammo/solr::8.3.1-ik ```
 
 挂载自己的数据卷: ```docker run -d -p 8983:8983 -v $PWD:/var/solr dreammo/solr::8.3.1-ik```
 
 创建自己的core:
 
 ```shell script
 docker exec -it container-name /bin/bash
 
 solr_create_core my_core
```
