FROM nordstrom/java:8-jre

# SCALA_VERSION is used in derived images
ENV CONFLUENT_MAJOR_VERSION="2.0" \
    SCALA_VERSION="2.11.7" \
    CONFLUENT_USER="confluent" \
    CONFLUENT_GROUP="confluent"

COPY confluent_platform_2_0.key /tmp/confluent_platform_2_0.key
RUN apt-get update -qy \
 && apt-get install -qy curl \
 && apt-key add /tmp/confluent_platform_2_0.key \
 && echo "deb http://packages.confluent.io/deb/2.0 stable main" > /etc/apt/sources.list.d/confluent.list \
 && groupadd -r ${CONFLUENT_GROUP} \
 && useradd -r -g ${CONFLUENT_GROUP} ${CONFLUENT_USER}
