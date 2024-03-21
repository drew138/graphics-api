# FROM golang:alpine AS builder
#
# RUN apk add --no-cache ca-certificates git
#
# WORKDIR /src
#
# COPY ./go.mod ./go.sum ./
#
# RUN go mod download
#
# COPY ./ ./
#
# RUN CGO_ENABLED=0 go build \
#     -installsuffix 'static' \
#     -o /app .
#
# FROM scratch AS final
#
# COPY --from=builder /app /app
#
# COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#
# EXPOSE 443
#
# EXPOSE 80
#
# VOLUME ["/cert-cache"]
#
# ENTRYPOINT ["/app"]

FROM golang:1.21.6-stretch

# RUN apt update && apt upgrade -y && \
#     apt install -y git \
#     make openssh-client
#
WORKDIR /app 

# RUN curl -fLo install.sh https://raw.githubusercontent.com/cosmtrek/air/master/install.sh \
#     && chmod +x install.sh && sh install.sh && cp ./bin/air /bin/air
#
COPY . .

RUN go mod download
