FROM quay.io/nordstrom/confluent-platform:2.0.1-2

ENV KAFKA_VERSION="0.9.0.1" \
    LOG_DIR="/var/log/kafka" \
    KAFKA_LOG_DIRS="/var/lib/kafka" \
    KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/etc/kafka/log4j.properties" \
    KAFKA_OPTS="-javaagent:/jmx_prometheus_javaagent.jar=1100:/jmx_exporter_config.yaml" \
    JMX_PORT=1099 \
    JMX_EXPORTER_PORT=1100

COPY log4j.properties /etc/kafka/log4j.properties
COPY jmx_exporter_config.yaml /
COPY kafka-docker.sh /usr/bin/kafka-docker.sh
RUN chmod +x /usr/bin/kafka-docker.sh

# Defer dropping to unprivileged user until container start-time,
#   in order to deal with start-time VOLUMES being mounted as root:
#   https://github.com/kubernetes/kubernetes/issues/2630#issuecomment-156115146
# USER ${CONFLUENT_USER}
VOLUME ["${KAFKA_LOG_DIRS}", "${LOG_DIR}"]
EXPOSE 9092 1099 1100

ENTRYPOINT ["/usr/bin/kafka-docker.sh"]
