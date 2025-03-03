FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    php php-fpm php-mysql php-gd php-xml php-curl php-zip curl

RUN mkdir -p /var/run/php/ \
    && chown www-data:www-data /var/run/php/

WORKDIR /var/www/html

COPY /config/wordpress.conf /etc/php/7.4/fpm/php-fpm.conf

COPY /scripts/wordpress.sh /usr/local/bin/wordpress.sh

RUN chmod +x /usr/local/bin/wordpress.sh
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown -R www-data:www-data /var/www /var/log

USER www-data

RUN wp core download

EXPOSE 9000

ENTRYPOINT ["wordpress.sh"]
