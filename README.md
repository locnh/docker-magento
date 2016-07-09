## Supported tags and respective `Dockerfile` links
* [`2`, `latest` (*2.x/Dockerfile*)](https://github.com/locnh/docker-magento/blob/master/2.x/Dockerfile)
* [`1` (*1.x/Dockerfile*)](https://github.com/locnh/docker-magento/blob/master/1.x/Dockerfile)

## What is this ?
Docker container built with CentOS 7, NGINX and PHP with compatible version and modules for Magento

These are the Docker Hub autobuild images located [here](https://hub.docker.com/r/locnh/docker-magento/).

![Magento Logo](https://upload.wikimedia.org/wikipedia/en/c/c2/Magento_logo.png)

## How to start
### The Simplest way, NginX - PHP-FPM by default
1. Pull the latest image

  ```
  $ docker pull locnh/docker-magento
  ```

2. Create container

  ```
  $ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 -d locnh/docker-magento
  ```

That's it !

## More Options

#### Using Apache (httpd) instead of NGinX
- Just add the environment variable with `-e WEB_SRV=apache` or `-e WEB_SRV=httpd`
- Example:

  ```
  $ docker run --name magento -e WEB_SRV=httpd -v /path/to/magento:/var/www/html -p 80:80 -d locnh/docker-magento
  ```

#### Enable Xdebug remote
- Just add the environment variable with `-e XDEBUG_RHOST=<REMOTE_HOST>`.
- Example your IDE is running at IP `10.0.75.1`:

  ```
  $ docker run --name magento -e XDEBUG_RHOST=10.0.75.1 -v /path/to/magento:/var/www/html -p 80:80 -d locnh/docker-magento
  ```

#### Mountable Volumes
Beside Webroot `/var/www/html`, you can use option `-v` to mount more volumes to the container such as services logs:
- NGinX logs:   `/var/log/nginx` 
- Apache logs:  `/var/log/httpd`
- PHP-FPM logs: `/var/www/php-fpm`

#### Please keep in mind
If you don't specify tag, default tag is `latest`. In case you need the build for specified version of magento, use the version as tag. For example, if you need a container to run:
- Magento `2.x`:

  ```
  $ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 -d locnh/docker-magento:2
  ```

- Magento `1.x`:

  ```
  $ docker run --name magento -v /path/to/magento:/var/www/html -p 80:80 -d locnh/docker-magento:1
  ```


## Contribute
1. Fork me
2. Make changes
3. Create pull request
4. Grab a cup of coffee
