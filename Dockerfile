FROM ubuntu
MAINTAINER Manfred Touron m@42.am

RUN apt-get install -y python-software-properties python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise main universe" >> /etc/apt/sources.list
RUN apt-get -q -y update
RUN apt-get install -q -y nodejs
RUN mkdir /app /node_modules
RUN npm install -g node-dev coffee-script


ADD . /app
RUN chmod +x /app/run.sh
RUN cd /app; npm install
RUN chown -R nobody /app

USER nobody
WORKDIR /app
CMD ["/app/run.sh"]



EXPORT 9159
