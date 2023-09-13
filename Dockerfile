FROM php:8.0-apache

RUN apt update \
    && apt-get install -y git unzip libicu-dev \
    && docker-php-ext-install intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./composer.json ./
COPY ./lib ./lib

RUN composer config -g repos.packagist composer https://packagist.jp # .jpにして高速化
RUN composer install
RUN composer dump-autoload
RUN git config --global --add safe.directory '*' # これがないとコンテナでのcomposerの実行が失敗する…
