FROM centos:centos7

RUN yum -y install https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
RUN yum -y install mysql-server
RUN yum -y install mysql-utilities
RUN yum -y install mysql-connector-python
RUN yum -y install openssh-clients
RUN ln -s /usr/lib/python2.7/site-packages/mysql/utilities /usr/lib64/python2.7/site-packages/mysql/utilities

