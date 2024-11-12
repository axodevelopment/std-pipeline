FROM golang:1.22.3 as builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=${TARGETOS:-linux} GOARCH=${TARGETARCH} go build -a -o service main.go

FROM golang

WORKDIR /

COPY --from=builder /app/service /service
USER 1111:1111

ENTRYPOINT ["/service"]
