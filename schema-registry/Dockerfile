FROM quay.io/nordstrom/confluent-platform:2.0.1

COPY schema-registry-docker.sh /usr/local/bin/

RUN apt-get update -qy \
 && apt-get install -qy confluent-schema-registry \
 && chmod +x /usr/local/bin/schema-registry-docker.sh

EXPOSE 8081

ENTRYPOINT ["/usr/local/bin/schema-registry-docker.sh"]
