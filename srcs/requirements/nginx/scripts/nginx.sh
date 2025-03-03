#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${CERTS_KEY_} \
    -out "${CERTS_}"  \
	-subj "/C=AT/L=W/O=42Vienna/OU=student/CN=${DOMAIN_NAME}"
	
exec "$@"
