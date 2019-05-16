FROM alpine:3.9 

RUN apk update \
	&& apk add nginx 

# nginx setup 
ENV SITE_ROOT=/www
RUN adduser -D -g 'www' www
RUN mkdir -p ${SITE_ROOT} 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www ${SITE_ROOT}
RUN mkdir -p /run/nginx
COPY site.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod u+x /usr/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
