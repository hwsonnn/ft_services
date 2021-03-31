#!/bin/bash

php-fpm7 -R
telegraf & nginx -g "daemon off;"
