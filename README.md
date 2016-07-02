### What is this ?
Docker container built with CentOS 7, NGINX and PHP with compatible version and modules for Magento

### Update
- Added build for Magento 2.1
- Added build for Magento 2.0
- Added build for Magento 1.x

### How to start
1. Pull the latest image
```
$ docker pull locnh/docker-magento
```
2. Create container
```
$ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 locnh/docker-magento
```
That's it !

### Please keep in mind
If you don't specify tag, default tag is `latest`. In case you need the build for specified version of magento, use the version as tag. For example, if you need a container to run:
- Magento `2.1`:
```
$ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 locnh/docker-magento:2.1
```
- Magento `1.x`:
```
$ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 locnh/docker-magento:1.x
```

### Remove the images, claim your disk space
1. Remove the container
```
$ docker rm magento
```
2. Remove the image
```
$ docker rmi locnh/docker-magento
```

### Contribute
1. Fork me
2. Make change
3. Create merge request
4. Grab a cup of coffee