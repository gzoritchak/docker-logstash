FROM java:7-jre

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y ca-certificates wget

RUN cd /opt && \
    wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-linux-x64.tar.gz && \
    tar -xzvf ./kibana-4.0.0-linux-x64.tar.gz && \
    mv kibana-4.0.0-linux-x64 kibana && \
    rm kibana-4.0.0-linux-x64.tar.gz

RUN apt-get install -y netcat

ADD conf/kibana.yml /opt/kibana/config/kibana.yml
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
