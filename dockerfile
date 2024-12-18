FROM golang:1.22.5 as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

FROM debian:buster-slim

COPY --from=builder /app/tracker /ust/local/bin/tracker

EXPOSE 8080

ENTRYPOINT ["tracker"]