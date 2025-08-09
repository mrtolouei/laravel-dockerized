FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libpq-dev \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libcurl4-openssl-dev \
    supervisor \
    && docker-php-ext-install sockets

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    pdo \
    pdo_pgsql \
    pdo_mysql \
    zip \
    exif \
    pcntl \
    soap \
    opcache

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

RUN curl -sSLo /usr/bin/supercronic https://github.com/aptible/supercronic/releases/download/v0.2.29/supercronic-linux-amd64 \
  && chmod +x /usr/bin/supercronic \
  && mkdir -p /etc/supercronic \
  && echo "*/1 * * * * php /var/www/artisan schedule:run --verbose --no-interaction" > /etc/supercronic/laravel

WORKDIR /var/www

COPY . .

COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage \
    && chmod -R 775 /var/www/bootstrap/cache

COPY ./docker/php/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./docker/php/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]
