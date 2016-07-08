FROM centos/httpd

MAINTAINER Loc Nguyen <me@locnh.com>

# Install EPEL and Remi
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Enable Remi PHP 5.5
RUN yum-config-manager --enable remi-php55

# Install PHP and Extensions 
RUN yum -y install  php \
                    php-bcmath \
                    php-cli \
                    php-common \
                    php-fpm \
                    php-gd \
                    php-intl \
                    php-mbstring \
                    php-mcrypt \
                    php-mysqlnd \
                    php-pdo \
                    php-pear \
                    php-pecl-igbinary \
                    php-pecl-imagick \
                    php-pecl-oauth \
                    php-pecl-redis \
                    php-pecl-xdebug \
                    php-pecl-zendopcache \
                    php-process \
                    php-soap \
                    php-xml \
                    php-zip

# Purge cache
RUN yum -y clean all

# Add Apache configuration
COPY config/httpd.conf /etc/httpd/conf/httpd.conf

# Add PHP configuration
COPY config/php.ini /etc/php.ini
COPY config/15-xdebug.ini /etc/php.d/15-xdebug.ini

# Add Kick-start script
COPY kick-start.sh /kick-start.sh
RUN chmod -v +x /kick-start.sh
ENTRYPOINT ["/kick-start.sh"]

# Add Apache init script
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# Install composer
ADD https://getcomposer.org/usr/local/bin/composer.phar /usr/local/bin/composer
RUN chmod -v +x /usr/local/bin/composer

EXPOSE 80

VOLUME ["/var/www/html", "/var/log/httpd"]

# Exec Apache Web Server
CMD ["/run-httpd.sh"]