FROM nordstrom/confluent-platform:2.0

COPY rest-proxy-docker.sh /usr/local/bin/

RUN apt-get update -qy \
 && apt-get install -qy confluent-kafka-rest \
 && chown -R ${CONFLUENT_USER}:${CONFLUENT_GROUP} /etc/kafka-rest /usr/local/bin/rest-proxy-docker.sh \
 && chmod +x /usr/local/bin/rest-proxy-docker.sh

USER ${CONFLUENT_USER}

EXPOSE 8082

CMD [ "/usr/local/bin/rest-proxy-docker.sh" ]
