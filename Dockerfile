FROM php:8.0-apache

RUN apt update \
    && apt-get install -y git libicu-dev \
    && docker-php-ext-install intl

COPY --from=composer /usr/bin/composer /usr/bin/composer

# COPY ./composer.json ./
# RUN composer install
# RUN composer dump-autoload
