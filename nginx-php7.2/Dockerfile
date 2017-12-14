FROM ubuntu:16.04
MAINTAINER Peerasan Buranasanti <peerasan@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# add NGINX official stable repository
RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu xenial main" > /etc/apt/sources.list.d/nginx.list  && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C  && \
echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main " > /etc/apt/sources.list.d/php.list  && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

#RUN sed -i -e "s/archive.ubuntu.com/mirror.ku.ac.th/g" /etc/apt/sources.list


# install packages
RUN apt-get update && apt-get -y install apt-utils

RUN apt-get -y --no-install-recommends install \
curl wget openssh-client wget curl git ffmpeg nano ca-certificates \
nginx php7.2 php7.2-fpm php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-pgsql php7.2-soap php7.2-sqlite3 php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip \
php-imagick && \
cp -r /etc/php /etc/php.orig && \
cp -r /etc/nginx /etc/nginx.orig && \
apt-get autoclean && apt-get -y autoremove && \
echo "<?php phpinfo();?>" > /var/www/html/info.php && \
mkdir -p /run/php


# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]
# # NGINX mountable directory for apps
# VOLUME ["/var/www"]

COPY fs /

# NGINX ports
EXPOSE 80 443

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
