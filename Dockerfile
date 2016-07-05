FROM centos

MAINTAINER Loc Nguyen <me@locnh.com>

# Add the ngix repository
COPY config/nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Install EPEL
RUN yum -y install epel-release

# Install nginx 
RUN yum -y install nginx

# Install Remi Repo
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
                    php-pecl-zendopcache \
                    php-process \
                    php-soap \
                    php-xml \
                    php-zip

# Install composer
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# Install supervisor
RUN yum -y install supervisor
RUN yum -y clean all

# Correct permision
RUN chown -R nginx:nginx /var/lib/php
RUN chown -R nginx:nginx /var/www/html

# Add Nginx configuration
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/magento.conf /etc/nginx/conf.d/default.conf

# Add PHP-FPM configuration
COPY config/php-fpm/php.ini /etc/php.ini
COPY config/php-fpm/www.conf /etc/php-fpm.d/www.conf
COPY config/php-fpm/php-fpm.conf /etc/php-fpm.conf

# Add Supervisor configuration
COPY config/supervisor/supervisord.conf /etc/

EXPOSE 80

# Exec supervisord
CMD ["/usr/bin/supervisord", "-n","-c","/etc/supervisord.conf"]