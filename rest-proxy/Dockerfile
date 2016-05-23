FROM quay.io/nordstrom/confluent-platform:2.0.1

COPY rest-proxy-docker.sh /usr/local/bin/

RUN apt-get update -qy \
 && apt-get install -qy confluent-kafka-rest \
 && chmod +x /usr/local/bin/rest-proxy-docker.sh

COPY jmx_exporter_config.yaml /

EXPOSE 8082

CMD [ "/usr/local/bin/rest-proxy-docker.sh" ]
