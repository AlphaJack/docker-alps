# build
FROM docker.io/library/golang:alpine AS build
WORKDIR /alps

RUN apk add --no-cache git && \
    git clone https://git.sr.ht/~migadu/alps . && \
    CGO_ENABLED=0 go build -tags netgo -v -a -ldflags '-extldflags "-static"' -o "alps" cmd/alps/main.go

# release
FROM docker.io/library/alpine:latest AS release
WORKDIR /

COPY --from=build ./alps/alps ./alps
COPY --from=build ./alps/themes/ ./themes
COPY --from=build ./alps/plugins/ ./plugins
COPY ./init ./init

LABEL org.opencontainers.image.source=https://github.com/AlphaJack/docker-alps

EXPOSE 1323

ENTRYPOINT ["/init"]
