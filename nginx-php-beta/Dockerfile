FROM ubuntu:18.04
MAINTAINER Peerasan Buranasanti <peerasan@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#RUN sed -i -e "s/archive.ubuntu.com/mirror.ku.ac.th/g" /etc/apt/sources.list
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install apt-utils curl wget openssh-client git ffmpeg nano ca-certificates software-properties-common

##Add NGINX official stable repository
#RUN echo "deb http://nginx.org/packages/ubuntu/ bionic nginx" > /etc/apt/sources.list.d/nginx.list  && \
#echo "deb-src http://nginx.org/packages/ubuntu/ bionic nginx " >> /etc/apt/sources.list.d/nginx.list

RUN add-apt-repository -y  ppa:ondrej/nginx-mainline; add-apt-repository -y ppa:ondrej/php;
##
##CAVEATS:
##1. If you are using php-gearman, you need to add ppa:ondrej/pkg-gearman
##2. If you are using apache2, you are advised to add ppa:ondrej/apache2
##3. If you are using nginx, you are advise to add ppa:ondrej/nginx-mainline
##   or ppa:ondrej/nginx
##

# install packages
RUN apt-get -y install nginx php7.2 php7.2-fpm php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-pgsql php7.2-soap php7.2-sqlite3 php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip php-imagick && \
cp -r /etc/php /etc/php.orig && \
cp -r /etc/nginx /etc/nginx.orig && \
apt-get autoclean && apt-get -y autoremove && apt-get -y dist-upgrade && \
echo "<?php phpinfo();?>" > /var/www/html/info.php

#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]
##NGINX mountable directory for apps
#VOLUME ["/var/www"]

COPY fs /

# nginx ports
EXPOSE 80 443

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
