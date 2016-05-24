FROM quay.io/nordstrom/java:8

# SCALA_VERSION is used in derived images
ENV CONFLUENT_MAJOR_VERSION="3.0.0" \
    SCALA_VERSION="2.11" \
    CONFLUENT_USER="confluent" \
    CONFLUENT_GROUP="confluent" \
    GOSU_SHA256SUM="34049cfc713e8b74b90d6de49690fa601dc040021980812b2f1f691534be8a50"

COPY confluent_platform_3_0.key /tmp/confluent_platform_3_0.key

RUN apt-key add /tmp/confluent_platform_3_0.key \
 && echo "deb [arch=amd64] http://packages.confluent.io/deb/3.0 stable main" > /etc/apt/sources.list.d/confluent.list \
 && groupadd -r ${CONFLUENT_GROUP} \
 && useradd -r -g ${CONFLUENT_GROUP} ${CONFLUENT_USER}

RUN curl -o /tmp/gosu -fsSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
 && echo "${GOSU_SHA256SUM}  /tmp/gosu" > /tmp/gosu.sha256 \
 && sha256sum -c /tmp/gosu.sha256 \
 && chmod +x /tmp/gosu \
 && mv /tmp/gosu /bin/gosu

COPY jmx_prometheus_javaagent.jar /jmx_prometheus_javaagent.jar
COPY jmx_exporter_config.yaml /
