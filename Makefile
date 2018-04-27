#SHELL = /bin/bash -x

VERSION = 0.1

RUN1 = docker run -p 127.0.0.1:9666:9666 --rm --net=host ##--detach=false
RUN3 = match_exporter/match_exporter:$(VERSION)
RUN = $(RUN1) $(RUN2) $(RUN3)

PROJECT = match_exporter

CONTAINER = $(PROJECT):$(VERSION)

RUNDOCKER = $(shell which docker) $@

DOCKERFILE = Dockerfile

all: push

run:
	python ./match_exporter.py

debug:
	python ./match_exporter.py -d

docker_debug:
	$(RUN1) $(RUN2) -it --entrypoint=/bin/bash $(RUN3)

docker_run:
	@$(RUN)

build:
	$(RUNDOCKER) --build-arg https_proxy=$(https_proxy) --build-arg http_proxy=$(http_proxy) -t match_exporter/$(CONTAINER) -f $(DOCKERFILE) .

push: build
	$(RUNDOCKER) match_exporter/$(CONTAINER)
