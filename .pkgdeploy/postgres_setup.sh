/usr/pgsql-11/bin/postgresql-11-setup initdb
systemctl enable postgresql-11
systemctl start postgresql-11
su - postgres -c "createuser djangoapp"
su - postgres -c "psql -c \"ALTER USER djangoapp WITH PASSWORD 'djangoapp';\""
su - postgres -c "createdb djangoapp -O djangoapp"
su - postgres -c "psql -c \"grant all privileges on database djangoapp to djangoapp;\""
sed -i 's/ident/md5/g' /var/lib/pgsql/11/data/pg_hba.conf
su - postgres -c "psql -c \"SELECT pg_reload_conf();\""
