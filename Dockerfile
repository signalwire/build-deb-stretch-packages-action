FROM debian:stretch 

ENV OS_ENV=stretch
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    dos2unix lsb-release build-essential devscripts  pkg-config \
    debhelper dh-autoreconf libglib2.0-dev libssl1.0-dev doxygen graphviz
RUN mkdir /data

WORKDIR /data
COPY run.sh run.sh
RUN chmod 755 run.sh
RUN dos2unix run.sh
CMD ["/data/run.sh"]