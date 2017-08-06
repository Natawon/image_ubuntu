#!/bin/sh

chown -Rf www-data:www-data /var/www/html
service nginx start
service php7.1-fpm start
while true; do sleep 60; done
