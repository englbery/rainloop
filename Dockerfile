FROM alpine:latest

#Installation of curl, fcgi, lighttpd and needed php modules
RUN apk add --update --no-cache \
    curl \
    fcgi \
    lighttpd \
    php \
    php-cgi \
    php-common \
    php-ctype \
    php-curl \
    php-dom \
    php-gd \
    php-gettext \
    php-iconv \
    php-imap \
    php-json \
    php-ldap \
    php-openssl \
    php-pdo \
    php-pdo_pgsql \
    php-pgsql \
    php-posix \
    php-soap \
    php-xml \
    php-xmlrpc \
 && rm -rf /var/cache/apk/*

# Copy configuration for lighttpd
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

# Create user&group (www-data:www-data) for lighttpd 
RUN adduser www-data -G www-data -H -s /bin/false -D


RUN mkdir -p /run/lighttpd/ \
 && chown www-data. /run/lighttpd/

# Fetch and run rainloop installer and set chmod and chown
RUN cd /var/www/ && \
    curl -sL http://repository.rainloop.net/installer.php | php && \
    find . -type d -exec chmod 755 {} \; && \
    find . -type f -exec chmod 644 {} \; && \
    chown -R www-data:www-data .

VOLUME /var/www/data

EXPOSE 80

#Run lighttpd with specified config
ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

#Run php-fpm
CMD php-fpm -D
