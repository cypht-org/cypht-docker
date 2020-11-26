FROM php:7.1-fpm-alpine

ENV CYPHT_DEST "/usr/local/share/cypht"

WORKDIR "/var/www"

RUN set -e \
    && apk add --no-cache \
       supervisor \
       nginx \
       composer \
       # GD
       freetype libpng libjpeg-turbo \
    && apk add --no-cache --virtual .build-deps \
       ca-certificates \
       wget \
       unzip \
       # For GD (2fa module)
       libpng-dev libjpeg-turbo-dev freetype-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd pdo pdo_mysql \
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
    && apk del .build-deps \
    && cd ${CYPHT_DEST} \
    && composer install \
    && sed -i 's/post_max_size = 8M/post_max_size = 80M/g' /etc/php7/php.ini \
    && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 80M/g' /etc/php7/php.ini

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
