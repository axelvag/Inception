FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y mariadb-server \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && mkdir -p /var/lib/mysql

COPY conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/mariadb.cnf
COPY ./tools/config.sh /config.sh

RUN chmod +x config.sh && chmod -R 777 /var/lib/mysql /var/run/mysqld

EXPOSE 3306

ENTRYPOINT ["./config.sh"]