FROM php:7.1.8-apache

COPY . /var/www/html
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo_mysql mbstring

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite
