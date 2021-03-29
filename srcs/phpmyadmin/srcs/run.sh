#!/bin/bash

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf /phpMyAdmin-5.0.2-all-languages.tar.gz
mv /phpMyAdmin-5.0.2-all-languages /etc/phpmyadmin

rm -rf /phpMyAdmin-5.0.2-all-languages.tar.gz
rm -rf /var/cache/apk/*

php-fpm7 -R
telegraf & nginx -g "daemon off;"
