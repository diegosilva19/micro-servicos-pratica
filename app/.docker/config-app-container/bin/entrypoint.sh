#!/bin/bash

sed -i "s/listen = [0-9]\{1,4\}/listen = $NGINX_FPM_PORT/" /usr/local/etc/php-fpm.d/zz-docker.conf
# sed -e "s/listen = 127\.0\.0\.1:[0-9]\{0,5\}/listen = 127.0.0.1:9099/" www.conf | less
composer install
php artisan key:generate
php artisan migrate
php-fpm
