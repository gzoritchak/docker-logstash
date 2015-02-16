#!/bin/sh

docker rm -f logstash.moncoachfinance.com

docker run -d \
  --name logstash.moncoachfinance.com \
  -v /home/mcf/infra/logstash/logstash-forwarder:/etc/logstash \
  -v `pwd`/data:/data \
  -p 9292:9292 \
  -p 9200:9200 \
  logstash
