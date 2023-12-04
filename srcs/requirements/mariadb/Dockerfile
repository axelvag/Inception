# FROM debian:buster

# RUN apt-get update -y
# RUN apt-get upgrade -y

# RUN apt update && \
#     apt install dumb-init curl less -y

# RUN apt update && \
#     apt install -y mariadb-server

# RUN mkdir -p /var/run/mysqld && \
#     chown -R 777 /var/run/mysqld

# COPY ./tools/mariadb.sh /mariadb.sh

# RUN chmod +x /mariadb.sh

# RUN mkdir -p /Users/avaganay/data/mariadb

# # ENTRYPOINT ["/mariadb.sh"]

# EXPOSE 3306

# CMD ["/bin/sh", "./mariadb.sh"]

FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && mkdir -p /var/lib/mysql

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/mariadb.conf
COPY ./tools/mariadb.sh /mariadb.sh
RUN chmod +x mariadb.sh && chmod -R 777 /var/lib/mysql /var/run/mysqld


EXPOSE 3306

ENTRYPOINT ["./mariadb.sh"]
# CMD ["/bin/sh", "./mariadb.sh"]

