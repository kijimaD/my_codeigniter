FROM php:8.0-apache

RUN apt update \
    && apt-get install -y git libicu-dev \
    && docker-php-ext-install intl

RUN git config --global --add safe.directory '*'
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./composer.json ./
RUN composer install
RUN composer dump-autoload
