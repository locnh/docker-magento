FROM centos:7

MAINTAINER Loc Nguyen <me@locnh.com>

# Add the ngix repository
COPY config/nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Install EPEL and Remi
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Enable Remi PHP 7.0
RUN yum-config-manager --enable remi-php70

# Install Web Servers 
RUN yum -y install nginx httpd

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

# Install supervisor
RUN yum -y install supervisor
RUN yum -y clean all

# Correct permision
RUN usermod -aG apache nginx

# Add Web servers configurations
COPY config/httpd/httpd.conf /etc/httpd/conf/httpd.conf
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/magento.conf /etc/nginx/conf.d/default.conf

# Add PHP-FPM configuration
COPY config/php-fpm/php.ini /etc/php.ini
COPY config/php-fpm/15-xdebug.ini /etc/php.d/15-xdebug.ini
COPY config/php-fpm/www.conf /etc/php-fpm.d/www.conf
COPY config/php-fpm/php-fpm.conf /etc/php-fpm.conf

# Add Supervisor configuration
COPY config/supervisor/supervisord.conf /etc/supervisord.conf

# Add Kick-start script
COPY kick-start.sh /usr/local/bin/kick-start.sh
RUN chmod -v +x /usr/local/bin/kick-start.sh

# Install composer
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
RUN chmod -v +x /usr/local/bin/composer

EXPOSE 80

VOLUME ["/var/www/html", "/var/log/httpd", "/var/log/nginx", "/var/log/php-fpm"]

# Exec supervisord
CMD ["kick-start.sh"]