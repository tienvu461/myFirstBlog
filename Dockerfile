FROM python:3.7.9-alpine3.12

# work directory
WORKDIR /usr/src/myFirstBlog

# set environment variables
# no .pyc
ENV PYTHONDONTWRITEBYTECODE 1
# no stdout stderr
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    && apk add postgresql \
    && pip install psycopg2 \
    && apk add jpeg-dev zlib-dev libjpeg \
    && pip install Pillow \
    && apk del build-deps
# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt


# copy entrypoint.sh
COPY ./myFirstBlog/entrypoint.sh .
RUN chmod +x /usr/src/myFirstBlog/entrypoint.sh

# source code
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/myFirstBlog/entrypoint.sh"]