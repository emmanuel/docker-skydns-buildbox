FROM emmanuel/golang-build:0.0.1
MAINTAINER Emmanuel Gomez "emmanuel@gomez.io"

ADD ./skydns-src /skydns-src
ENV GOPATH /skydns-src/
# VOLUME /skydns-build
# RUN cd /skydns-src && go get -d -v ./... && go build -v ./...
# RUN cd /skydns-src && go get -d -v ./...
# RUN cd /skydns-src && go build -v ./...
RUN cd /skydns-src && go build -o /skydns
