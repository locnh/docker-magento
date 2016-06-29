# docker-nginx-magento2
Docker container built with CentOS 7, PHP 7.0 and NginX 1.10 for Magento2

## How to start

```
$ docker run --name magento2 -v /path/to/magento2:/var/www/html -p 80:80 locnh/docker-nginx-magento2
```

Please keep in mind: `/path/to/magento2` includes `/pub`, in an other way you have a valid path like this `/path/to/magento2/pub`.

That's it !