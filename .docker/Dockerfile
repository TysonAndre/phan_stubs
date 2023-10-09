#FROM shippingdocker/php-composer:7.0
ARG PHPV=7.1

FROM dockette/php:${PHPV}

ARG PHPV
ENV PHPVERSION=$PHPV

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
	libmemcached-dev \
	zlib1g \
	zlib1g-dev \
	libyaml-dev \
	libzip-dev \
	libssl-dev \
	libpng-dev \
	php-pear \
	php$PHPV-apcu \
	php$PHPV-bcmath \
	php$PHPV-dev \
	php$PHPV-dom \
	php$PHPV-exif \
	php$PHPV-json \
	php$PHPV-fileinfo \
	php$PHPV-gd \
	php$PHPV-igbinary \
	php$PHPV-intl \
	php$PHPV-imagick \
	php$PHPV-fileinfo \
	php$PHPV-mailparse \
	php$PHPV-mbstring \
	php$PHPV-mcrypt \
	php$PHPV-memcache \
	php$PHPV-memcached \
	php$PHPV-mongodb \
	php$PHPV-mysql \
	php$PHPV-opcache \
	php$PHPV-redis \
	php$PHPV-soap \
	php$PHPV-socket \
	php$PHPV-xml \
	php$PHPV-simplexml \
	php$PHPV-xmlwriter \
	php$PHPV-yaml \
	php$PHPV-zip \
        build-essential \
        && \
    apt-get autoremove && \
    apt-get autoclean

RUN mkdir /phan && mkdir /usr/src/extensions
ADD composer.json /phan
ADD install_extensions.sh /usr/src/extensions

RUN cd /phan && composer install
WORKDIR /usr/src/extensions

RUN apt-get update && apt install -y bc libncurses5-dev && ./install_extensions.sh
