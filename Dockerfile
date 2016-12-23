# Dockerfile for post deployment testing
FROM python:2.7
MAINTAINER Caihua Yin <alend.yin@gmail.com>

RUN pip install nose && pip install requests
COPY testcases /opt/post-deployment-test/testcases
COPY run.sh /opt/post-deployment-test/
WORKDIR /opt/post-deployment-test

ENTRYPOINT ["/opt/post-deployment-test/run.sh"]
