FROM golang:alpine AS base

WORKDIR /usr/src/app

COPY ./helloworld.go .

RUN go mod init helloworld \
    && go build

FROM scratch

COPY --from=base /usr/src/app/helloworld .

CMD [ "/helloworld" ]