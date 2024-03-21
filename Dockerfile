FROM golang:1.22

WORKDIR /app 

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 go build \
    -installsuffix 'static' \
    -o /app .o

EXPOSE 80


ENTRYPOINT ["/app"]
