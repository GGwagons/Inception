FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl && apt-get clean && rm -rf /var/lib/apt-get/lists/*

# Create necessary directories
RUN mkdir -p /etc/ssl/private

# Copy NGINX configuration
COPY config/nginx.conf /etc/nginx/nginx.conf

COPY /scripts/nginx.sh .

RUN chmod +x nginx.sh

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443

ENTRYPOINT ["./nginx.sh"]
