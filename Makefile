.PHONY: all deps test docker copy_templates

VERSION?=$(shell git describe HEAD | sed s/^v//)
DATE?=$(shell date -u '+%Y-%m-%d_%H:%M:%S')
DOCKERTAG?=eremetic:${VERSION}
LDFLAGS=-X main.Version '${VERSION}' -X main.BuildDate '${DATE}'
SRC=$(shell find . -name '*.go')

all: test

deps:
	go get -t ./...

test: eremetic
	go test -v ./...

eremetic: deps
eremetic: ${SRC}
	go build -ldflags "${LDFLAGS}" -o $@

docker/eremetic: ${SRC}
	CGO_ENABLED=0 GOOS=linux go build -ldflags "${LDFLAGS}" -a -installsuffix cgo -o $@

copy_templates:
	cp -r static docker
	cp -r templates docker

docker: docker/eremetic copy_templates
	docker build -t ${DOCKERTAG} docker