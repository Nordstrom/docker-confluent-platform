FROM quay.io/nordstrom/confluent-kafka:0.9.0.1

ENV ZK_DATA_DIR="/var/lib/zookeeper" \
    KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/etc/kafka/zk-log4j.properties"

COPY zk-docker.sh /usr/local/bin/
COPY zk-log4j.properties /etc/kafka/

# assume root user in order to mkdir. confluent-kafka sets USER to confluent.
USER root
RUN mkdir ${ZK_DATA_DIR} \
 && chown -R ${CONFLUENT_GROUP}:${CONFLUENT_USER} ${ZK_DATA_DIR} /usr/local/bin/zk-docker.sh /etc/kafka/zookeeper.properties /etc/kafka/zk-log4j.properties \
 && chmod +x /usr/local/bin/zk-docker.sh

USER ${CONFLUENT_USER}
VOLUME ["${ZK_DATA_DIR}"]

# Expose client port (2188/tcp), peer connection port (2888/tcp), leader election port (3888/tcp)
EXPOSE 2181 2888 3888

ENTRYPOINT ["/usr/local/bin/zk-docker.sh"]
CMD [""]
