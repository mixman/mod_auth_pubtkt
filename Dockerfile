FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
	build-essential checkinstall vim curl \
    apache2 apache2-dev libssl-dev

WORKDIR /opt/app
COPY . /opt/app/
RUN mkdir -p /opt/app
RUN cd /opt/app/ && ./configure --apachever=2.4 && make && checkinstall --fstrans=no --default

USER root
CMD ["bash"]
