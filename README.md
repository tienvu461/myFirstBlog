# myFirstBlog
trying to host my first blog

# For Windows User
1. Install Ubuntu 20.04 on WSL 2 
https://ubuntu.com/blog/ubuntu-on-wsl-2-is-generally-available
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly

2. Install Terminal
https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701

3. Install Docker Desktop to work with Ubuntu on WSL 2
https://docs.docker.com/docker-for-windows/wsl/

4. Install Docker & Docker compose on Ubuntu on WSL 2
### Open Terminal with Ubuntu 
```
sudo apt-get install docker.io
```
5. Check all prerequisites are completed:
```
docker --version 
Docker version 20.10.2, build 2291f61
docker-compose --version
docker-compose version 1.27.4, build 40524192
pip --version
pip 20.0.2 from /usr/lib/python3/dist-packages/pip (python 3.8)
python --version
Python 3.8.5
```

6. Start services
### Create env file at project root directory: ".env.prd" and ".env.prd.db" add allow host from server ip
```
DEBUG=0
SECRET_KEY=...
DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1]
SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=...
SQL_USER=...
SQL_PASSWORD=...
SQL_HOST=postgresql
SQL_PORT=5432
DATABASE=postgres
```
```
POSTGRES_USER=...
POSTGRES_PASSWORD=...
POSTGRES_DB=...
```

### Build and start docker 
```
chmod +x myFirstBlog/entrypoint.sh
docker-compose up -d --build
```
### Tail logs
```
docker-compose logs -f
```
### Create superuser
```
docker-compose exec blog python manage.py createsuperuser
```
### Flush and migrate
```
docker-compose -f docker-compose.prd.yml up -d --build
docker-compose -f docker-compose.prd.yml exec blog python ./myFirstBlog/manage.py flush --no-input
docker-compose -f docker-compose.prd.yml exec blog python ./myFirstBlog/manage.py makemigrations --noinput
docker-compose -f docker-compose.prd.yml exec blog python ./myFirstBlog/manage.py migrate --noinput
docker-compose -f docker-compose.prd.yml exec blog python ./myFirstBlog/manage.py collectstatic --no-input --clear
```
### Check db
```
docker-compose exec postgresql psql --username=blogdb --dbname=blogdb
```
### Restore db
```
cat dump_17-01-2021_15_42_37.sql | docker exec -i myfirstblog_postgresql_1 psql -U blogdb
```
# Reference

https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/
https://github.com/developerayyo/django-blog/blob/master/blog/templates/blog/post/detail.html
https://github.com/rileypredum/Your_Blog_Part_2/blob/master/src/templates/read_article.html