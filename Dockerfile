FROM golang:1.22

WORKDIR /app 

COPY . .

RUN go mod download

RUN  go build -o /app/server

EXPOSE 80


RUN go build -o main .

CMD ["./main"]
