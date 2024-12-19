FROM php:8.3-fpm
MAINTAINER martin scharm <https://binfalse.de/contact>

# Install SSMTP for mail support
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    msmtp \
    curl \
    unzip \
    zlib1g-dev \
    libpng-dev \
    libjpeg62-turbo \
    libjpeg62-turbo-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libmcrypt-dev \
    libxml2-dev \
    libzip-dev \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN docker-php-source extract \
 && docker-php-ext-install -j$(nproc) mysqli curl zip gd pdo_mysql \
 && docker-php-source delete


