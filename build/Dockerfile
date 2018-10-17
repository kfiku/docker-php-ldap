FROM kfiku/docker-php-ldap

RUN apk add --no-cache \
        alpine-sdk \
        gcc \
        g++ \
        autoconf \
        automake  \
        build-base
RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
