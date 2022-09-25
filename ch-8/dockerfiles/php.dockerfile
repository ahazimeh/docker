# we need fpm-alpine image for the nginx config we are using
# FROM php:7.4-fpm-alpine
FROM php:8.0-fpm-alpine
# FROM php:8.0.24RC1-fpm-alpine3.16

WORKDIR /var/www/html

COPY src .

RUN docker-php-ext-install pdo pdo_mysql

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel

#since we don't have a command then it will automatically run the command of the base image