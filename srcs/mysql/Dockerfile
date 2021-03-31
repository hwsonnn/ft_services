FROM	alpine:3.12

RUN		apk update && \
		apk add mariadb mariadb-client openrc supervisor
										# supervisor -> 서비스 모니터링 for 데이터 유지
RUN 	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz && \
		tar -C . -xzf telegraf-1.14.0-static_linux_amd64.tar.gz && \
		chmod +x telegraf/telegraf && \
		cp telegraf/telegraf /usr/bin/ && \
		rm -rf telegraf-1.14.0-static_linux_amd64.tar.gz telegraf/ && \
		mkdir -p /etc/telegraf

COPY	/srcs/run.sh /
COPY	/srcs/setup.sh /
COPY 	/srcs/my.cnf /etc/mysql/my.cnf
COPY 	/srcs/supervisord.conf /etc/supervisord.conf
COPY 	/srcs/wordpress.sql /
COPY 	/srcs/telegraf.conf /etc/telegraf

VOLUME 	["/sys/fs/cgroup"]

EXPOSE 	3306

CMD		["sh", "run.sh"]