FROM centos/httpd

MAINTAINER Loc Nguyen <me@locnh.com>

# Install EPEL and Remi
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Enable Remi PHP 7.0
RUN yum-config-manager --enable remi-php70

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

# Install composer
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# Purge cache
RUN yum -y clean all

# Add Apache configuration
COPY config/httpd.conf /etc/httpd/conf/

# Add PHP configuration
COPY config/php.ini /etc/php.ini
COPY config/15-xdebug.ini /etc/php.d/15-xdebug.ini

# Add Kick-start script
ADD kick-start.sh /usr/local/bin/
ENTRYPOINT ["kick-start.sh"]

EXPOSE 80

VOLUME ["/var/www/html", "/var/log/httpd"]

# Exec Apache Web Server
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]