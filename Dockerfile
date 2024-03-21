FROM golang:1.22

WORKDIR /app 

COPY . .

RUN go mod download

EXPOSE 80

RUN go build -o main .

CMD ["./main"]
