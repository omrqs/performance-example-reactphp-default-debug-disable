#!/bin/sh

# Configuring application permissions
mkdir -p ./var/log && chmod -Rf 777 ./var/log
mkdir -p ./var/cache && chmod -Rf 777 ./var/cache

# Running composer and cleanup cache.
php -d memory_limit=0 /usr/local/bin/composer i -o --prefer-dist --no-progress
php bin/console cache:clear

# Starting local server and dumper.
chmod +x bin/reactphp-server
bin/reactphp-server
