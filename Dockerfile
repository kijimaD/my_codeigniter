FROM php:8.0-apache as php

RUN apt update \
    && apt-get install -y git unzip libicu-dev \
    && docker-php-ext-install intl

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./composer.json ./
COPY ./lib ./lib

RUN composer config -g repos.packagist composer https://packagist.jp # .jpにして高速化
RUN composer install
RUN composer dump-autoload
