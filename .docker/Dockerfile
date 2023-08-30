FROM shippingdocker/php-composer:7.4
RUN apt-get update -y && \
    apt-get install -y \
	libmemcached-dev \
	zlib1g \
	zlib1g-dev \
	libyaml-dev \
	libzip-dev \
	libssl-dev \
	libpng-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd

RUN mkdir /phan
ADD composer.json /phan
RUN cd /phan && composer install
RUN mkdir /usr/src/extensions/
WORKDIR /usr/src/extensions
ADD install_extensions.sh ./
#RUN ./install_extensions.sh
