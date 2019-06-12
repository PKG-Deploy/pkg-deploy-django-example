chown -R pkgdeploy:pkgdeploy %{buildroot}/opt/pkgdeploy/djangoapp/
export PATH="/usr/pgsql-11/bin:$PATH"

# Warning: This is not a great way to check postgres' initdb has been run
if pg_isready | grep -q "/var/run/postgresql:5432 - no response"; then
  postgresql-11-setup initdb
  sed -i "s|127.0.0.1/32            ident|127.0.0.1/32            md5|g" /var/lib/pgsql/11/data/pg_hba.conf
  systemctl enable postgresql-11
  systemctl start postgresql-11
  su -c "psql -c \"CREATE USER djangoapp PASSWORD 'djangoapp';\"" postgres
  su -c "psql -c \"CREATE DATABASE djangoapp OWNER djangoapp;\"" postgres
  su -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE djangoapp TO djangoapp;\"" postgres
fi

source %{buildroot}/opt/pkgdeploy/djangoapp/venv/bin/activate
python %{buildroot}/opt/pkgdeploy/djangoapp/djangoapp/manage.py migrate
python /opt/pkgdeploy/djangoapp/djangoapp/manage.py collectstatic --noinput
