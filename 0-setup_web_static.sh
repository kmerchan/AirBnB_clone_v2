#!/usr/bin/env bash
# sets up web servers with Nginx, folders, and config to deploy web_static
sudo apt-get -y update
sudo apt-get -y install nginx
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
touch /data/web_static/releases/test/index.html
echo "simple content\n" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown --recursive ubuntu:ubuntu /data/
sed -i 's|location / {|location /hbnb_static {\n\t\talias /data/web_static/current/\n\t}\n\n\tlocation / {|' /etc/nginx/sites-available/default
service nginx restart