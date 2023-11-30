# FROM mariadb:latest

# EXPOSE 3306

FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt update && \
    apt install dumb-init curl less -y

RUN apt update && \
    apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY tools/mariadb.sh /mariadb.sh

RUN chmod +x /mariadb.sh

RUN mkdir -p /Users/avaganay/data/mariadb

# ENTRYPOINT ["/mariadb.sh"]

CMD ["bash", "/mariadb.sh"]
    
EXPOSE 3306
