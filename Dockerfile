############################################################
# Dockerfile: CentOS 6.8 / PHP 7.0 / Nginx 1.10
############################################################
FROM centos:6.8

MAINTAINER Loc Nguyen <me@locnh.com>

# Add the ngix repository
ADD config/nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Install EPEL
RUN yum -y install epel-release

# Install nginx 
RUN yum -y install nginx

# Install PHP
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum -y install --enablerepo=remi-php70 php-mysqlnd php-common php-gd php-pear php-xml php-mbstring php-mcrypt php-bcmath php-opcache php-cli php-soap php-pecl-oauth php-fpm php-intl php-pecl-redis

# Install supervisor
RUN yum -y install supervisor
RUN yum -y clean all

# Correct permision
RUN chown -R nginx:nginx /var/lib/php
RUN chown -R nginx:nginx /var/www/html

# Add Nginx configuration
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/magento2.conf /etc/nginx/conf.d/default.conf

# Add PHP-FPM configuration
COPY config/php-fpm/php.ini /etc/php.ini
COPY config/php-fpm/www.conf /etc/php-fpm.d/www.conf
COPY config/php-fpm/php-fpm.conf /etc/php-fpm.conf

# Add Supervisor configuration
COPY config/supervisor/supervisord.conf /etc/

EXPOSE 80

# Exec supervisord
CMD ["/usr/bin/supervisord", "-n","-c","/etc/supervisord.conf"]