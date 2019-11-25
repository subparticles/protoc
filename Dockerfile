FROM debian:10.1-slim

RUN apt-get update
RUN apt-get install curl zip -y

ENV PROTOC_VERSION=3.9.1
ENV OS_VERSION=linux-x86_64
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-$OS_VERSION.zip

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN chmod +x /usr/local/bin/protoc
RUN chmod -R 755 /usr/local/include

RUN rm -f $PROTOC_ZIP
