FROM python:alpine3.9
MAINTAINER "Daniel Uche."

 ENV PYTHONUNBUFFERED 1

 # Install dependencies
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev

RUN pip install -r /requirements.txt

RUN apk del .tmp-build-deps

 # Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create app user this prevents user attacker gaining access to 
# the root account of system
RUN adduser -D user
USER user