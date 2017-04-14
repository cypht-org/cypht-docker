FROM php:7.1-fpm-alpine

ENV CYPHT_DEST "/usr/local/share/cypht"

WORKDIR "/var/www"

RUN set -e \
    && apk add --no-cache \
       ca-certificates \
       wget \
       unzip \
       supervisor \
       nginx \
       # memcached? \
    && docker-php-ext-install pdo pdo_mysql \
    && mkdir ${CYPHT_DEST} \
    && cd ${CYPHT_DEST} \
    && mkdir /tmp/cypht-temp \
    && cd /tmp/cypht-temp \
    && wget https://github.com/jasonmunro/cypht/archive/master.zip \
    && unzip master.zip \
    && cp cypht-master/hm3.sample.ini cypht-master/hm3.ini \
    && find cypht-master -type d -print | xargs chmod 755 \
    && find cypht-master -type f -print | xargs chmod 644 \
    && chown -R root:root cypht-master \
    && mv cypht-master/* ${CYPHT_DEST} \
    && cd /tmp \
    && rm -rf cypht-temp \
    && apk del \
       wget \
       unzip \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY docker-entrypoint.sh /usr/local/bin/
COPY cypht_setup_database.php /tmp/cypht_setup_database.php

RUN set -ex \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && chmod 700 /tmp/cypht_setup_database.php \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["docker-entrypoint.sh"]
