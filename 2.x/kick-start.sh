#!/bin/bash

# Xdebug Switch
if [ "$XDEBUG_RHOST" ]
then
    sed -i "s/^\;zend_extension/zend_extension/g" /etc/php.d/15-xdebug.ini
    sed -i "s/^\;xdebug/xdebug/g" /etc/php.d/15-xdebug.ini
    sed -i "s/^xdebug.remote_host.*/xdebug.remote_host=$XDEBUG_RHOST/g" /etc/php.d/15-xdebug.ini
else
    sed -i "s/^zend_extension/\;zend_extension/g" /etc/php.d/15-xdebug.ini
    sed -i "s/^xdebug/\;xdebug/g" /etc/php.d/15-xdebug.ini
fi

# Web Server Switch
if [ ! -h /etc/supervisord.d/server.ini ]
then
    if [ "$WEB_SRV" == "httpd" -o "$WEB_SRV" == "apache" ]
    then
        ln -s /etc/supervisord.d/httpd.ini.sample /etc/supervisord.d/server.ini
    else
        ln -s /etc/supervisord.d/nginx.ini.sample /etc/supervisord.d/server.ini
    fi
fi

exec /usr/bin/supervisord -n -c /etc/supervisord.conf