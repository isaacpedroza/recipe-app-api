FROM python:3.7-alpine
MAINTAINER isaac

# avoid python to buffer data.
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# user with permissions to run apps only.
RUN adduser -D user
USER user