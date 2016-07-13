FROM centos:7

MAINTAINER Loc Nguyen <me@locnh.com>

# Add the ngix repository
COPY config/nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Install EPEL and Remi
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Enable Remi PHP 5.5
RUN yum-config-manager --enable remi-php55

# Install Supervisor, NginX, Apache, PHP and Extensions
RUN yum -y install  nginx httpd supervisor which \
                    php \
                    php-bcmath \
                    php-cli \
                    php-fpm \
                    php-gd \
                    php-intl \
                    php-mbstring \
                    php-mcrypt \
                    php-mysqlnd \
                    php-pdo \
                    php-pecl-igbinary \
                    php-pecl-imagick \
                    php-pecl-oauth \
                    php-pecl-redis \
                    php-pecl-xdebug \
                    php-pecl-zendopcache \
                    php-process \
                    php-soap \
                    php-xml \
                    php-zip && yum clean all

# Add Web servers configurations
COPY config/httpd/httpd.conf /etc/httpd/conf/httpd.conf
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/magento.conf /etc/nginx/conf.d/default.conf

# Add PHP-FPM configuration
COPY config/php/xdebug.ini /etc/php.d/xdebug.ini
COPY config/php/www.conf /etc/php-fpm.d/www.conf

# Add Supervisor configuration
COPY config/supervisor/cronpy.ini /etc/supervisord.d/cronpy.ini
COPY config/supervisor/httpd.ini /etc/supervisord.d/httpd.ini.sample
COPY config/supervisor/nginx.ini /etc/supervisord.d/nginx.ini.sample

# Add cronpy for Magento
COPY bin/cronpy /usr/local/bin/cronpy
RUN chmod -v +x /usr/local/bin/cronpy

# Install Python schedule library for cronpy to run
RUN curl https://bootstrap.pypa.io/get-pip.py | python && pip install schedule

# Add Kick-start script
COPY bin/kick-start /usr/local/bin/kick-start
RUN chmod -v +x /usr/local/bin/kick-start

EXPOSE 80

VOLUME ["/var/www/html", "/var/log/httpd", "/var/log/nginx", "/var/log/php-fpm"]

CMD ["kick-start"]