#!/bin/bash

php artisan migrate --force
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
