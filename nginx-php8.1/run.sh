#!/bin/sh
chown -Rf www-data:www-data /var/www/html
service nginx start
service php8.0-fpm start
while true; do sleep 60; done
