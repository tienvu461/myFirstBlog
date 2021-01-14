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
### Build and start docker 
```
docker-compose up -d --build
```
### Tail logs
```
docker-compose logs -f
```
### Create superuser
```
docker-compose exec web python manage.py createsuperuser
```
### Check db
```
docker-compose exec db psql --username=blogdb --dbname=blogdb
```

# Reference

https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/