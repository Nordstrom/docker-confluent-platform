FROM quay.io/nordstrom/confluent-platform:2.0.1-2

COPY connect-avro-distributed.properties /etc/kafka-connect/kafka-connect-distributed.properties
COPY kafka-connect-docker.sh /usr/bin/
RUN chmod +x /usr/bin/kafka-connect-docker.sh

COPY jmx_exporter_config.yaml /

EXPOSE 8083

ENTRYPOINT ["/usr/bin/kafka-connect-docker.sh"]
