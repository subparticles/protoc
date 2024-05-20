FROM debian:10.1-slim

RUN apt-get update
RUN apt-get install curl zip -y

ENV PROTOC_VERSION=25.3
ENV OS_VERSION=linux-x86_64
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-$OS_VERSION.zip
ENV PROTOC_GEN_GRPC_JAVA_VERSION=1.64.0

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN chmod +x /usr/local/bin/protoc
RUN chmod -R 755 /usr/local/include
RUN curl -OL https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/$PROTOC_GEN_GRPC_JAVA_VERSION/protoc-gen-grpc-java-$PROTOC_GEN_GRPC_JAVA_VERSION-$OS_VERSION.exe
RUN mv protoc-gen-grpc-java-$PROTOC_GEN_GRPC_JAVA_VERSION-$OS_VERSION.exe /usr/local/bin
RUN chmod +x /usr/local/bin/protoc-gen-grpc-java-$PROTOC_GEN_GRPC_JAVA_VERSION-$OS_VERSION.exe

RUN rm -f $PROTOC_ZIP
