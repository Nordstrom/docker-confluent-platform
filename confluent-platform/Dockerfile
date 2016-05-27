FROM quay.io/nordstrom/java:8

# SCALA_VERSION is used in derived images
ENV CONFLUENT_PLATFORM_MAJOR_VERSION="2.0" \
    CONFLUENT_PLATFORM_VERSION="2.0.1" \
    SCALA_VERSION="2.11.7" \
    CONFLUENT_USER="confluent" \
    CONFLUENT_GROUP="confluent" \
    GOSU_SHA256SUM="5ec5d23079e94aea5f7ed92ee8a1a34bbf64c2d4053dadf383992908a2f9dc8a"

COPY confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz.sha1.txt /tmp/
RUN cd /tmp \
 && curl -LOfS http://packages.confluent.io/archive/${CONFLUENT_PLATFORM_MAJOR_VERSION}/confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz \
 && sha1sum -c confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz.sha1.txt \
 && tar xvzf confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz \
 && rm confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz \
 && mv confluent-${CONFLUENT_PLATFORM_VERSION}/bin/* /usr/bin/ \
 && mv confluent-${CONFLUENT_PLATFORM_VERSION}/etc/* /etc/ \
 && mv confluent-${CONFLUENT_PLATFORM_VERSION}/share/doc/* /usr/share/doc/ \
 && mv confluent-${CONFLUENT_PLATFORM_VERSION}/share/java/* /usr/share/java/ \
 && groupadd -r ${CONFLUENT_GROUP} \
 && useradd -r -g ${CONFLUENT_GROUP} ${CONFLUENT_USER}

RUN rmdir /tmp/confluent-${CONFLUENT_PLATFORM_VERSION}/share/doc \
 && rmdir /tmp/confluent-${CONFLUENT_PLATFORM_VERSION}/share/java

COPY gosu-amd64-1.9.sha256.txt /tmp/
RUN cd /tmp \
 && curl -LOfS "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64" \
 && sha256sum -c /tmp/gosu-amd64-1.9.sha256.txt \
 && chmod +x /tmp/gosu-amd64 \
 && mv /tmp/gosu-amd64 /bin/gosu

COPY jmx_prometheus_javaagent.jar /jmx_prometheus_javaagent.jar
COPY jmx_exporter_config.yaml /
