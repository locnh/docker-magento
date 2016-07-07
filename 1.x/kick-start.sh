#!/bin/bash

set -eo pipefail

if [ "$XDEBUG_RHOST" ]; then
    sed -i "s/^\;zend_extension/zend_extension/g" /etc/php.d/15-xdebug.ini
    sed -i "s/^\;xdebug/xdebug/g" /etc/php.d/15-xdebug.ini
    sed -i "s/^xdebug.remote_host.*/xdebug.remote_host=$XDEBUG_RHOST/g" /etc/php.d/15-xdebug.ini
else
    sed -i "s/^zend_extension/\;zend_extension/g" /etc/php.d/15-xdebug.ini
    sed -i "s/^xdebug/\;xdebug/g" /etc/php.d/15-xdebug.ini
fi

exec "$@"