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
supervisor \
curl wget openssh-client wget curl git ffmpeg nano \
nginx \
php7.0 php7.0-fpm php7.0-common php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-pgsql php7.0-soap php7.0-sqlite3 php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip && \
cp -r /etc/php /etc/php.orig && \
cp -r /etc/nginx /etc/nginx.orig && \
cp -r /etc/supervisor /etc/supervisord.orig && \
apt-get autoclean && apt-get -y autoremove && \
mkdir -p /run/php

#    nginx php7.0-fpm
#    php7.0-fpm php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-pgsql php7.0-soap php7.0-sqlite3 php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip

# configure NGINX as non-daemon
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# # configure php-fpm as non-daemon
#RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf

# # clear apt cache and remove unnecessary packages
#RUN apt-get autoclean && apt-get -y autoremove

# # add a phpinfo script for INFO purposes
# RUN echo "<?php phpinfo();" >> /var/www/html/index.php

# # NGINX mountable directories for config and logs
# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]
# # NGINX mountable directory for apps
# VOLUME ["/var/www"]

COPY fs /

# copy config file for Supervisor
#COPY config/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# backup default default config for NGINX
#RUN cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# copy local defualt config file for NGINX
# COPY config/nginx/default /etc/nginx/sites-available/default

# php7.0-fpm will not start if this directory does not exist


# NGINX ports
EXPOSE 80 443

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
