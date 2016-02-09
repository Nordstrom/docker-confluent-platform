FROM nordstrom/confluent-platform:2.0

ENV KAFKA_VERSION="0.9.0.0" \
    KAFKA_LOGS="/var/log/kafka" \
    KAFKA_LOG_DIRS="/var/lib/kafka"

COPY kafka-docker.sh /usr/local/bin/

RUN apt-get update -qy \
 && apt-get install -qy confluent-kafka-${SCALA_VERSION}=${KAFKA_VERSION}-1 \
 && mkdir -p ${KAFKA_LOG_DIRS} ${KAFKA_LOGS} \
 && chown -R ${CONFLUENT_USER}:${CONFLUENT_GROUP} ${KAFKA_LOG_DIRS} ${KAFKA_LOGS} /etc/kafka/server.properties /usr/local/bin/kafka-docker.sh \
 && chmod +x /usr/local/bin/kafka-docker.sh


USER ${CONFLUENT_USER}
VOLUME ["${KAFKA_LOG_DIRS}", "${KAFKA_LOGS}"]
EXPOSE 9092

ENTRYPOINT ["/usr/local/bin/kafka-docker.sh"]
