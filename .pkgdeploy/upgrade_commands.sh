nginx -s reload
systemctl daemon-reload
/opt/pkgdeploy/djangoapp/venv/bin/python /opt/pkgdeploy/djangoapp/djangoapp/manage.py migrate
/opt/pkgdeploy/djangoapp/venv/bin/python /opt/pkgdeploy/djangoapp/djangoapp/manage.py collectstatic --no-input
systemctl restart djangoapp
