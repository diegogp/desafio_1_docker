FROM golang:1.17-bullseye as build
WORKDIR /go/src/app

COPY ./main.go .

RUN go env -w GO111MODULE=off
RUN go get -d -v ./...
RUN go build -o /go/bin/app

FROM scratch
WORKDIR /go/src/app

COPY --from=build /go/bin/app / 

CMD ["/app"]

