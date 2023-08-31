FROM php:7.4.33-fpm-alpine

ENV CYPHT_DEST "/usr/local/share/cypht"

WORKDIR "/var/www"

RUN set -e \
    && apk add --no-cache \
       supervisor \
       nginx \
       composer \
       # GD
       freetype libpng libjpeg-turbo \
       php-session php-fileinfo  php-dom php-xml libxml2-dev php-xmlwriter php-tokenizer \
    && apk add --no-cache --virtual .build-deps \
       ca-certificates \
       wget \
       unzip \
       # For GD (2fa module)
       libpng-dev libjpeg-turbo-dev freetype-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install gd pdo pdo_mysql \
    && mkdir ${CYPHT_DEST} \
    && cd ${CYPHT_DEST} \
    && mkdir /tmp/cypht-temp \
    && cd /tmp/cypht-temp \
    && wget https://github.com/cypht-org/cypht/archive/master.zip \
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
    && composer self-update --2 \
    && composer install \
    && echo "post_max_size = 60M" >> /usr/local/etc/php/php.ini \
    && echo "upload_max_filesize = 50M" >> /usr/local/etc/php/php.ini

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
