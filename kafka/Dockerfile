FROM quay.io/nordstrom/confluent-platform:3.0.0-0

ENV KAFKA_VERSION="0.10.0.0" \
    LOG_DIR="/var/log/kafka" \
    KAFKA_LOG_DIRS="/var/lib/kafka" \
    KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/etc/kafka/log4j.properties" \
    KAFKA_OPTS="-javaagent:/jmx_prometheus_javaagent.jar=1100:/jmx_exporter_config.yaml" \
    JMX_PORT=1099 \
    JMX_EXPORTER_PORT=1100

RUN apt-get update -qy \
 && apt-get install -qy confluent-kafka-${SCALA_VERSION}=${KAFKA_VERSION}-1

COPY kafka-docker.sh /usr/local/bin/kafka-docker.sh
COPY log4j.properties /etc/kafka/log4j.properties
COPY jmx_exporter_config.yaml /

RUN chmod +x /usr/local/bin/kafka-docker.sh

# Defer dropping to unprivileged user until container start-time,
#   in order to deal with start-time VOLUMES being mounted as root:
#   https://github.com/kubernetes/kubernetes/issues/2630#issuecomment-156115146
# USER ${CONFLUENT_USER}
VOLUME ["${KAFKA_LOG_DIRS}", "${LOG_DIR}"]
EXPOSE 9092 1099 1100

ENTRYPOINT ["/usr/local/bin/kafka-docker.sh"]
