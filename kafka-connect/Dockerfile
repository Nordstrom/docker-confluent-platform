FROM quay.io/nordstrom/confluent-platform:2.0.1-2

COPY kafka-connect-docker.sh /usr/bin/
RUN chmod +x /usr/bin/kafka-connect-docker.sh

COPY jmx_exporter_config.yaml /

EXPOSE 8083

ENTRYPOINT ["/usr/bin/kafka-connect-docker.sh"]
