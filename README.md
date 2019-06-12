# Django example for PKG Deploy

RPM builds with:
* Python3.6 / pip
* Django
* Postgres 11 using psycopg2 (manually built in the RPM as an example. i.e. not using psycopg2-binary)
* UWSGI
* Nginx
* Systemd

_Note: This is just an example. The settings, requirements, layout etc are
not done using best practices and are not production ready._


## Local setup

```
python3.6 -m venv ./venv
source ./venv/bin/activate
pip install -r requirements.txt
export ENVIRONMENT=dev

./djangoapp/manage.py runserver 0:8000
```

## Package install

The package requires `postgresql11-server`. For Centos7 this requires a few other packages to be installed before being able to resolve this dependecy:
```bash
yum install -y epel-release centos-release-scl-rh # For llvm required by PostgreSQL
yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```


## ToDo
* Make password use environment variables
