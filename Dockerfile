FROM python:3.7-slim-buster

ENV APP_HOME /app
WORKDIR $APP_HOME

RUN apt-get update && apt-get install -y \
    libboost-all-dev 

RUN apt-get install -y build-essential
RUN apt-get install -y cmake 
RUN apt-get install -y git 
RUN pip install git+https://github.com/EthanRosenthal/nest2D.git@download-dependencies
RUN pip install nannernest    

RUN pip install Flask requests gevent

COPY . $APP_HOME


CMD ["python", "process-nanner.py"]
