FROM python:alpine3.9
MAINTAINER "Daniel Uche."

 ENV PYTHONUNBUFFERED 1

 # Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

 # Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create app user this prevents user attacker gaining access to 
# the root account of system
RUN adduser -D user
USER user