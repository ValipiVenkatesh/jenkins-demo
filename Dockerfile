FROM ubuntu:20.04

RUN apt-get update && apt-get install -y nginx

RUN mkdir fun/

WORKDIR fun

ADD Java.java .

RUN pwd

CMD ["bash"]

COPY README.md .

RUN README.md > "Persistent"

EXPOSE 8084
