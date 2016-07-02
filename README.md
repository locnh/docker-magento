# Docker container built with CentOS 7, NGINX and PHP with compatible version and modules for Magento

## Update
- Added build for Magento 2.1
- Added build for Magento 2.0
- Added build for Magento 1.x

## How to start
```
$ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 locnh/dockerun-magento
```
That's it !

## Please keep in mind: 
If you don't specify tag, default tag is `latest`. In case you need the build for specified version of magento, use the version as tag. For example, if you need a container to run `Magento 2.1`:
```
$ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 locnh/dockerun-magento:2.1
```

## Start 

## Contribute
1. Fork me
2. Make change
3. Create merge request
4. Grab a cup of coffee