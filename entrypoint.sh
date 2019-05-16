#!/bin/sh
set -x
PORT=${PORT:-8080}
NGINX_CONF=/etc/nginx/conf.d/default.conf
sed -i "s|listen 80|listen ${PORT}|" ${NGINX_CONF}
nginx &

/bin/sh
