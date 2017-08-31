FROM centos:latest
MAINTAINER Noki <yb.noki@gmail.com>

RUN yum update 

## repo mongodb 3.4 ##
RUN echo "[mongodb-org-3.4]" > /etc/yum.repos.d/mongodb-org-3.4.repo
RUN echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb-org-3.4.repo
RUN echo "baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.4.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/mongodb-org-3.4.repo                                                                                                               
RUN echo "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.4.repo
RUN echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc" >> /etc/yum.repos.d/mongodb-org-3.4.repo

## install mongodb ##
RUN yum install -y mongodb-org  git python build-essential curl
RUN service mongod start

## repo EPEL 7.10 ##
## RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
## RUN rpm -ivh epel-release-7-10.noarch.rpm

## install node.js ##
RUN yum install -y nodejs npm --enablerepo=epel

## install express and tools ##
RUN yum install -y yo bower grunt-cli generator-meanjs express supervisor

RUN mkdir /app
RUN chmod 777 -R /app

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000

RUN echo "\n##############################\n1. Create a new user with adduser, 'su' into that user.\n2. 'yo meanjs' to scaffold your app in the current directory.\n3. Start mongo in the background (e.g. 'mongod &')\n##############################\n"

