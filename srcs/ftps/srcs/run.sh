#!/bin/bash

mkdir -p /ftps/hson
adduser --home=/ftps/hson -D hson

echo "hson:0000" | chpasswd
echo "hson" >> etc/vsftpd/vsftpd.userlist

touch /var/log/vsftpd.log

mkdir -p /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -config etc/ssl/private/openssl.conf

telegraf &/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf