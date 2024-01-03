FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod init example/output && \
    go build -o /go/bin/app/fullcycle

FROM scratch

COPY --from=builder /go/bin/app/fullcycle .
CMD ["./fullcycle"]