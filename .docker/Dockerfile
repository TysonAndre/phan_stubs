FROM php:7.1-cli
RUN apt-get update -y
RUN apt-get install -y \
	libmemcached-dev \
	zlib1g \
	zlib1g-dev \
	libyaml-dev \
	libzip-dev \
	libssl-dev
RUN mkdir /usr/src/extensions/
WORKDIR /usr/src/extensions
ADD install_extensions.sh ./
RUN ./install_extensions.sh
