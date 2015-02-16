FROM java:7-jre

# Download version 1.4.2 of logstash
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar -xzvf ./logstash-1.4.2.tar.gz && \
    mv ./logstash-1.4.2 /opt/logstash && \
    rm ./logstash-1.4.2.tar.gz

# Install contrib plugins
RUN /opt/logstash/bin/plugin install contrib

# Copy build files to container root
#RUN mkdir /app
ADD app /app
ADD conf.d /opt/logstash/conf.d/

RUN sed -i -e 's@"http://.*",@"http://logs-es.moncoachfinance.com",@g' /opt/logstash/vendor/kibana/config.js
RUN cat /opt/logstash/vendor/kibana/config.js

# Kibana
EXPOSE 9292
EXPOSE 9200

# Start logstash
ENTRYPOINT ["/app/boot"]
