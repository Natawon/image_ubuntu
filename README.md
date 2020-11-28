# ubuntu

## Welcome to Minimalist Ubuntu + Nginx + PHP (PHP7, PHP8)

### All Latest Stable Version
- Ubuntu: 20.04 LTS
- Nginx: 1.19.0
- PHP 8.0.0

### How to use
<code>docker run -p 80:80 -h nginx-php -d patrickz/nginx-php:8.0</code>

<code>docker run -p 80:80 -v /apps:/var/www/html -h nginx -d patrickz/nginx-php:8.0</code>
