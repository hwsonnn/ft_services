#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/* /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress

rm -rf latest.tar.gz
cp wp-config.php  /var/www/wordpress/wp-config.php
adduser -G www-data -D www-data		#얘도 권한?? => ㅇㅇ
php-fpm7 -R							#->php 동적페이지 실행

telegraf & nginx -g 'daemon off;'