# FROM php:7.4-fpm
FROM php:8.0.12-fpm
# COPY ../html /usr/src
# WORKDIR /usr/src


# Update and install common packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    g++ \
    curl \
    wget \
    apt-utils \
    gnupg \
    software-properties-common \
    apt-transport-https \
    libxml2-dev

# SQLSRV requirements
# RUN wget -qO - https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && wget -qO - https://packages.microsoft.com/config/debian/9/prod.list \
#     > /etc/apt/sources.list.d/mssql-release.list

# Update and install common packages
# RUN apt-get update && apt-get install --no-install-recommends -y \
#     libfreetype6-dev \
#     libjpeg62-turbo-dev \
#     libmcrypt-dev \
#     libpng-dev \
#     unixodbc-dev \
#     zlib1g-dev \
#     libicu-dev \
#     && ACCEPT_EULA=Y apt-get install --no-install-recommends -y msodbcsql17 mssql-tools \
#     && apt-get install --no-install-recommends -y \
#     libaio-dev \
#     freetds-dev \
#     libssl-dev \
#     openssl \
#     supervisor

# Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Memcached
# RUN apt-get update && apt-get install -y libmemcached11 libmemcachedutil2 libmemcached-dev libz-dev git
# RUN cd /root \
#     && git clone -b php7 https://github.com/php-memcached-dev/php-memcached \
#     && cd php-memcached \
#     && phpize \
#     && ./configure \
#     && make \
#     && make install \
#     && cd .. \
#     && rm -rf  php-memcached \
#     && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
#     && apt-get remove -y build-essential libmemcached-dev libz-dev \
#     && apt-get remove -y libmemcached-dev libz-dev \
#     && apt-get autoremove -y \
#     && rm -rf /var/lib/apt/lists/* \
#     && apt-get clean

# APCU Backwards Compatibility
#RUN pecl install apcu && pecl install apcu_bc-1.0.4 \
#    && echo "extension=apcu.so" >> /usr/local/etc/php/conf.d/apcu.ini \
#    && echo "extension=apc.so" >> /usr/local/etc/php/conf.d/apcu.ini

# OPcache
# RUN docker-php-ext-configure opcache --enable-opcache \
#     && docker-php-ext-install opcache

# SQLSrv
# RUN pecl install sqlsrv pdo_sqlsrv

# Install and enable PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# RUN docker-php-ext-enable sqlsrv pdo_sqlsrv

# RUN docker-php-ext-install bcmath

# RUN docker-php-ext-install soap

ENV TZ=Europe/Madrid

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN printf '[PHP]\ndate.timezone = "Europe/Madrid"\n' > /usr/local/etc/php/conf.d/tzone.ini