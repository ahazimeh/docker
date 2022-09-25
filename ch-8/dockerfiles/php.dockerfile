# we need fpm-alpine image for the nginx config we are using
FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

#since we don't have a command then it will automatically run the command of the base image