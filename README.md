# docker-nginx-magento
Docker container built with CentOS 7, PHP 5.5 and NginX 1.10 for Magento

## How to start

```
$ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 locnh/docker-nginx-magento
```

Please keep in mind: `/path/to/magento` includes `index.php`, in an other way you have a valid path like this `/path/to/magento/index.php`.

That's it !