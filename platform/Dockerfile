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
curl \
wget \
openssh-client \
git \
ffmpeg \
nano \
sudo \
npm \
nodejs \
ca-certificates \
nginx \
php7.1 php7.1-fpm php7.1-common php7.1-tokenizer php7.1-curl php7.1-gd php7.1-intl php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-pgsql php7.1-soap php7.1-sqlite3 php7.1-xml php7.1-xmlrpc php7.1-xsl php7.1-zip \
php-imagick ghostscript php-soap php-mcrypt php-zip php-bcmath postfix libssh2-1 php-ssh2 && \
cp -r /etc/php /etc/php.orig && \
cp -r /etc/nginx /etc/nginx.orig && \
apt-get autoclean && apt-get -y autoremove && \
echo "<?php phpinfo();?>" > /var/www/html/info.php && \
mkdir -p /run/php

RUN curl -s http://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN apt install nodejs

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - 
RUN sudo apt-get install -y nodejs
RUN npm install -g sass   
# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]
# # NGINX mountable directory for apps
# VOLUME ["/var/www"]

COPY fs /

# NGINX ports
EXPOSE 80 443

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
