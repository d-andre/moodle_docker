FROM php:7.4.27-apache

RUN docker-php-ext-install mysqli
# php extensions
RUN apt-get update && apt-get install -y \
        libzip-dev zip netcat libpng-dev libicu-dev libxml2-dev libpcre3-dev \
     && apt-get install -y git libzip-dev dos2unix \
  && docker-php-ext-install zip gd intl \
     && docker-php-ext-install soap \
     && docker-php-ext-install xmlrpc \
     && docker-php-ext-install opcache \
    && docker-php-ext-install exif

RUN pecl install xdebug

ADD ./apache/000-default.conf /etc/apache2/sites-available
ADD ./php/php.ini /usr/local/etc/php
ADD ./php/xdebug.ini /usr/local/etc/php/conf.d
ADD ./php/error_reporting.ini /usr/local/etc/php/conf.d

RUN usermod -u 1000 -G www-data www-data
USER www-data
WORKDIR /var/www/html
