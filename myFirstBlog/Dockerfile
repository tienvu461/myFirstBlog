FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /source
COPY requirements.txt /source/
RUN pip install -r requirements.txt
COPY . /source/