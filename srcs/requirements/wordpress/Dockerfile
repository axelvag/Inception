FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-client php-fpm php-mysql php-curl php-dom php-imagick php-mbstring php-zip php-gd php-intl curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/
RUN mkdir -p /run/php

EXPOSE 9000

COPY ./tools/wp_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_config.sh

ENTRYPOINT ["/usr/local/bin/wp_config.sh"]