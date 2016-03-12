FROM nordstrom/confluent-platform:2.0.1

COPY schema-registry-docker.sh /usr/local/bin/

RUN apt-get update -qy \
 && apt-get install -qy confluent-schema-registry \
 && chown -R ${CONFLUENT_USER}:${CONFLUENT_GROUP} /etc/schema-registry/schema-registry.properties /usr/local/bin/schema-registry-docker.sh \
 && chmod +x /usr/local/bin/schema-registry-docker.sh

USER ${CONFLUENT_USER}
EXPOSE 8081

ENTRYPOINT ["/usr/local/bin/schema-registry-docker.sh"]
