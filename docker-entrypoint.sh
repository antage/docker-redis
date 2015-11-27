#!/bin/bash
set -e

if [ "$1" = 'redis' ]; then
    echo "Updating redis configuration files."
    /usr/local/bin/confd -onetime -backend env

    echo "Starting Redis in foreground."
    exec gosu nobody:nogroup /usr/bin/redis-server /etc/redis/redis.conf
fi

exec "$@"
