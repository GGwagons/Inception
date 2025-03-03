#!/bin/bash

wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}" --allow-root --extra-php="define( 'WP_DEBUG_LOG', 1); define( 'WP_DEBUG', 1);"
wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USR}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}" --allow-root
wp user create "${WP_USR}" "${WP_EMAIL}" --role=author --user_pass="${WP_PWD}" --allow-root

exec php-fpm7.4 -F
