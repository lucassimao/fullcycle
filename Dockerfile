FROM golang:1.20.5-alpine3.17 as build

WORKDIR /var/app

COPY go.mod .
COPY hello.go .

RUN go build

FROM scratch

WORKDIR /app

COPY --from=build /var/app/hello /app

CMD ["/app/hello"]