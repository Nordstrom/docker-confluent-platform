FROM quay.io/nordstrom/confluent-platform:2.0.1

COPY confluent-tools.sh /
ENTRYPOINT ["/confluent-tools.sh"]
CMD ["kafka-avro-console-consumer"]
