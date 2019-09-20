# requiring Docker 17.05 or higher on the daemon 
# see https://docs.docker.com/develop/develop-images/multistage-build/
# BUILD COMMAND :
# docker --build-arg RELEASE_VERSION=0.0.1 -t example/demo:v0.0.1 .

# author: liyan
# mail: liyana@hualala.com

# build backend

FROM 172.20.93.68/base/golang:1.12.7 as backend

COPY . /go/src/demo

RUN cd /go/src/demo && go build .


# build release image

FROM 172.20.93.68/base/alpine as alpine

COPY --from=backend /go/src/demo/demo /backend

WORKDIR /

CMD ["./backend"]
