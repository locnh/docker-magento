# docker-php-magento2
Docker container with CentOS 6, PHP 7.0 and NginX 1.10 for Magento2

## How to start
```
$ cd docker-nginx-magento2
$ docker build -t magento2 .
$ docker run --name magento2 -v /path/to/magento2:/var/www/html -p 80:80 magento2
```
That's it !