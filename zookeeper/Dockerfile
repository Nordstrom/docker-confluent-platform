FROM nordstrom/confluent-kafka:0.9.0.1

ENV zk_dataDir="/var/lib/zookeeper" \
    zk_dataLogDir="/var/run/zookeeper" \
    KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/etc/kafka/zk-log4j.properties"

COPY zk-docker.sh /usr/local/bin/
COPY zk-log4j.properties /etc/kafka/

RUN chmod +x /usr/local/bin/zk-docker.sh

VOLUME ["${zk_dataDir}","${zk_dataLogDir}"]

# Expose client port (2188/tcp), peer connection port (2888/tcp), leader election port (3888/tcp)
EXPOSE 2181 2888 3888

ENTRYPOINT ["/usr/local/bin/zk-docker.sh"]
CMD [""]
