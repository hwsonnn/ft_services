#! bin/sh
 
# https://wiki.alpinelinux.org/wiki/Mysql 알파인 위키 참고
# /usr/bin/mysql_install_db
# /etc/init.d/mariadb setup
# /etc/init.d/mariadb start 를 경로를 알아서 찾아서 실행해주는 명령어가 rc-service 인 듯
# rc-service 명령을 실행하기 위해 openrc를 설치하고 실행해줘야 함
openrc
# 그리고 아래 파일을 만들어 줘야 rc-service mariadb command가 실행이 된다.
touch /run/openrc/softlevel

/usr/bin/mysql_install_db
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'hson'@'%' IDENTIFIED BY '0000';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'hson'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql -u root wordpress < wordpress.sql

# mariadb daemon 실행
telegraf & /usr/bin/mysqld_safe --datadir=/var/lib/mysql