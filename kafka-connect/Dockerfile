FROM quay.io/nordstrom/confluent-kafka:0.9.0.1

COPY connect-avro-distributed.properties /etc/kafka-connect/kafka-connect.properties
COPY kafka-connect-docker.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/kafka-connect-docker.sh

# TODO: file an issue with Confluent
# seems that the start script for connect is packaged with Kafka, while the classes
# (e.g., io.confluent.connect.avro.AvroConverter) are packaged with the schema registry
RUN apt-get update -qy \
 && apt-get install -qy confluent-schema-registry

EXPOSE 8083

ENTRYPOINT ["/usr/local/bin/kafka-connect-docker.sh"]
