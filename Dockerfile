FROM php:fpm
MAINTAINER martin scharm <https://binfalse.de>


RUN docker-php-ext-install -j$(nproc) mysqli

# Install SSMTP for mail support
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ssmtp \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

