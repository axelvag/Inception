FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-client php-fpm php-mysql php-curl php-dom php-imagick php-mbstring php-zip php-gd php-intl curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# installer le CLI qui configure automatiquement wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# toutes les commandes qui suivent seront executees dans ce repo
WORKDIR /var/www/html/
# ce repo peut être utilisé pour stocker des fichiers temporaires ou des sockets liés à PHP
# -p permet de creer le chemin complet y compris les repertoires parents
RUN mkdir -p /run/php

EXPOSE 9000

COPY ./tools/wp_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_config.sh

ENTRYPOINT ["/usr/local/bin/wp_config.sh"]