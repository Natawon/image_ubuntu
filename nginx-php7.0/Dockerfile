FROM ubuntu:latest
LABEL MAINTAINER="Peerasan Buranasanti <peerasan@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

#RUN sed -i -e "s/archive.ubuntu.com/mirror.ku.ac.th/g" /etc/apt/sources.list
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install apt-utils curl wget openssh-client git ffmpeg nano ca-certificates software-properties-common

##Add NGINX official stable repository
#RUN echo "deb http://nginx.org/packages/ubuntu/ bionic nginx" > /etc/apt/sources.list.d/nginx.list  && \
#echo "deb-src http://nginx.org/packages/ubuntu/ bionic nginx " >> /etc/apt/sources.list.d/nginx.list

RUN add-apt-repository -y  ppa:ondrej/nginx-mainline; add-apt-repository -y ppa:ondrej/php;

# install packages
RUN apt-get -y install nginx php7.0 php7.0-fpm php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0-mbstring php7.0-mysql php7.0-opcache php7.0-pgsql php7.0-soap php7.0-sqlite3 php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip php-imagick && \
cp -r /etc/php /etc/php.orig && \
cp -r /etc/nginx /etc/nginx.orig && \
apt-get autoclean && apt-get -y autoremove && \
echo "<?php phpinfo();?>" > /var/www/html/info.php

#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]
##NGINX mountable directory for apps
#VOLUME ["/var/www"]

COPY fs /

# nginx ports
EXPOSE 80 443

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
