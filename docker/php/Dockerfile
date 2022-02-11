# FROM php:7.4-fpm
# FROM php:8.0.12-fpm
FROM php:${PHP_VERSION}
# COPY ../html /usr/src
# WORKDIR /usr/src
WORKDIR /var/www


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
    # libbz2-dev \
    # libc-client-dev \
    # libcurl4-gnutls-dev \
    # libedit-dev \
    # libfreetype6-dev \
    # libicu-dev \
    # libjpeg62-turbo-dev \
    # libkrb5-dev \
    # libldap2-dev \
    # libldb-dev \
    # libmagickwand-dev \
    # libmcrypt-dev \
    # libmemcached-dev \
    # libpng-dev \
    # libpq-dev \
    # libsqlite3-dev \
    # libssl-dev \
    # libreadline-dev \
    # libxslt1-dev \
    # libzip-dev \
    # memcached \
    # unzip \
    # zlib1g-dev \
    # && docker-php-ext-install -j$(nproc) \
    # bcmath \
    # bz2 \
    # calendar \
    # exif \
    # gettext \
    # mysqli \
    # opcache \
    # pdo_mysql \
    # pdo_pgsql \
    # pgsql \
    # soap \
    # sockets \
    # xmlrpc \
    # xsl \
    # && docker-php-ext-configure gd --with-freetype --with-jpeg \
    # && docker-php-ext-install -j$(nproc) gd \
    # && PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    # && docker-php-ext-install -j$(nproc) imap \
    # && docker-php-ext-configure intl \
    # && docker-php-ext-install -j$(nproc) intl \
    # && docker-php-ext-configure ldap \
    # && docker-php-ext-install ldap \
    # && docker-php-ext-configure zip \
    # && docker-php-ext-install zip \
    # && pecl install xdebug && docker-php-ext-enable xdebug \
    # && pecl install memcached && docker-php-ext-enable memcached \
    # && pecl install mongodb && docker-php-ext-enable mongodb \
    # && pecl install redis && docker-php-ext-enable redis \
    # && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    # && docker-php-source delete \
    # && apt-get remove -y g++ wget \
    # && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
    # && rm -rf /var/lib/apt/lists/* \
    # && rm -rf /tmp/* /var/tmp/*

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

RUN docker-php-ext-install soap

ENV TZ=Europe/Madrid

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN printf '[PHP]\ndate.timezone = "Europe/Madrid"\n' > /usr/local/etc/php/conf.d/tzone.ini