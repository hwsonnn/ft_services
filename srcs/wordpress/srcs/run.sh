#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mkdir /var/www/wordpress
mv wordpress/ /var/www/wordpress/

rm -rf latest.tar.gz
cp wp-config.php  /var/www/wordpress/wp-config.php

# 권한 설정
adduser -G www-data -D www-data
chown -R www-data:www-data /var/www/wordpress

php-fpm7 -R
telegraf & nginx -g 'daemon off;'