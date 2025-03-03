#!/bin/bash

# Create the init.sql file
cat <<EOF > /etc/mysql/init.sql
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF

# Initialize MySQL database
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Create required directories and set proper ownership
mkdir -p /run/mysqld
mkdir -p /var/log/mysql  # Ensure the log directory exists
chown -R mysql:mysql /run/mysqld /var/log/mysql  # Set ownership for both directories

# Start MySQL with the init file
exec mysqld --user=mysql --init-file=/etc/mysql/init.sql
