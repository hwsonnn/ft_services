#! bin/bash

#mysqld
supervisord -c /etc/supervisord.conf  & tail -f /dev/null