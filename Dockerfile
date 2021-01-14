FROM python:3.8.3-alpine

# work directory
WORKDIR /usr/src/myFirstBlog

# set environment variables
# no .pyc
ENV PYTHONDONTWRITEBYTECODE 1
# no stdout stderr
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./myFirstBlog/entrypoint.sh .

# source code
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/myFirstBlog/entrypoint.sh"]