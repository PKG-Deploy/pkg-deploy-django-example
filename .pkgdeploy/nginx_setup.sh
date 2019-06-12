rm -f /etc/nginx/conf.d/default.conf
sed -i '/listen       80 default_server/d' /etc/nginx/nginx.conf
systemctl enable nginx
systemctl start nginx
nginx -s reload
