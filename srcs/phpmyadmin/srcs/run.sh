#!/bin/bash

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
tar -xvf /phpMyAdmin-4.9.5-all-languages.tar.gz
mv /phpMyAdmin-4.9.5-all-languages /etc/phpmyadmin

rm -rf /phpMyAdmin-4.9.5-all-languages.tar.gz
rm -rf /var/cache/apk/*

php-fpm7 -R
telegraf & nginx -g "daemon off;"
