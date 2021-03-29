#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress

rm -rf latest.tar.gz
cp wp-config.php  /var/www/wordpress/wp-config.php

# 권한 설정
adduser -G www-data -D www-data

php-fpm7 -R
telegraf & nginx -g 'daemon off;'