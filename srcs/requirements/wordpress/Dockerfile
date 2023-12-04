# FROM debian:buster

# # RUN echo DockerfileWordpress

# RUN apt-get update -y
# RUN apt-get upgrade -y

# RUN apt update && \
#     apt install dumb-init curl less -y

# # installer wget, un utilitaire en ligne de commande permettant de recuperer des fichiers depuis le Web
# RUN apt-get install wget -y

# # ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]

# RUN chown -R root:root /var/www/wordpress

# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# # installer le CLI qui configure automatiquement wordpress
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# WORKDIR /var/www/html/

# RUN mkdir -p /run/php

# EXPOSE 9000

# COPY ./tools/wp_setup.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/wp_setup.sh
# CMD ["/bin/sh", "/usr/local/bin/wp_setup.sh" ]

# # ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]


FROM debian:buster

RUN sleep 10

RUN apt-get update && \
    apt-get install -y mariadb-client php-fpm php-mysql php-curl php-dom \
                       php-imagick php-mbstring php-zip php-gd php-intl curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/

RUN mkdir -p /run/php

EXPOSE 9000

COPY ./tools/wp_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup.sh
CMD ["/bin/sh", "/usr/local/bin/wp_setup.sh" ]

# ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]
