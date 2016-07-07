#!/bin/sh

if [[ -n $XDEBUG_HOST ]]; then
    sed -i.bak s/^zend_extension/\;zend_extension/g /etc/php.d/15-xdebug.ini
else
    sed -i.bak s/^\;zend_extension/zend_extension/g /etc/php.d/15-xdebug.ini
    echo "xdebug.remote_enable=on" >> /etc/php.d/15-xdebug.ini
    echo "xdebug.remote_host=$XDEBUG_HOST" >> /etc/php.d/15-xdebug.ini
fi