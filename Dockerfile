FROM php:7-fpm-alpine
ENV TZ=Europe/Prague
ENV TIMEZONE=Europe/Prague

# Instaling depts
RUN apk update && apk add --no-cache \
    bash \
    git \
    libcrypto1.1 \
    libressl \
    libzip \
    openldap \
    openldap-back-mdb \
    openssh-client \
    sqlite \
    unzip \
    zlib

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini
RUN "date"

RUN echo 'alias sf="php bin/console"' >> ~/.bashrc

RUN apk add --no-cache --virtual .build-deps \
        openldap-dev \
        libzip-dev \
        zlib-dev && \
    docker-php-ext-install -j$(nproc) \
        zip \
        ldap && \
    apk del .build-deps

WORKDIR /application
