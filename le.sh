#!/bin/sh

echo creating / cpdating certificates at $(date --utc)
certbot certonly -t -n --agree-tos --renew-by-default --email "alex@koi.science" --webroot -w /var/www/koi.science/ -d "koi.science" -d "www.koi.science"
echo "certificates updated"

echo "activating nginx config"
rm -f /etc/nginx/conf.d/default.conf
ln -s /etc/nginx/koi.science.conf /etc/nginx/conf.d/default.conf
echo "nginx configured"
