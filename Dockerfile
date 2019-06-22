FROM php:7.3.6-fpm-alpine3.9

WORKDIR /var/www
RUN apk add bash sed mysql-client \
    && rm -rf /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY ./app/ /var/www
RUN ln -s public html

EXPOSE 9000
ENTRYPOINT ["php-fpm"]