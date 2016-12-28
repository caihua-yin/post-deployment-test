IMAGE_NAME ?= post-deplopment-test
DOCKER_TAG ?= latest

all: run
TEST_ENDPOINT ?= http://192.168.33.21 # Should not be production endpoint during development testing

env: requirements.txt
	rm -rf env
	virtualenv env
	env/bin/pip install -r requirements.txt

check: env
	env/bin/flake8 --exclude=env/ --max-line-length=120 -j 1
	#pylint --rcfile=pylintrc *.py

run: check
	. env/bin/activate && ENDPOINT=$(TEST_ENDPOINT) nosetests -v testcases

image:
	docker build --pull -t yinc2/$(IMAGE_NAME):$(DOCKER_TAG) -f Dockerfile .

push:
	docker push yinc2/$(IMAGE_NAME):$(DOCKER_TAG)

clean:
	rm -rf env
	rm -f testcases/*.pyc

.PHONY: check run clean
