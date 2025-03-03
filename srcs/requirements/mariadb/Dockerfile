FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server && apt-get clean && rm -rf /var/lib/apt-get/lists/*

COPY /config/mariadb.conf /etc/mysql/my.cnf

COPY /scripts/mariadb.sh .

RUN chmod +x mariadb.sh

RUN mkdir /run/mysqld

ENTRYPOINT ["./mariadb.sh"]
