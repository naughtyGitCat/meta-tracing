FROM golang:alpine as builder

ENV CLASH_HOST='192.168.100.254:9090'
ENV CLASH_TOKEN='12345'
ENV VECTOR_ADDR='vector:9000'

RUN apk add --no-cache git
WORKDIR /scraper-src
COPY . /scraper-src
RUN go mod download && \
    go build -o /scraper .

FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /scraper /
ENTRYPOINT ["/scraper"]
