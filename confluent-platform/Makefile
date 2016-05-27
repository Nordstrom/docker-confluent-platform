container_name := confluent-platform
container_registry := quay.io/nordstrom
container_release := 2.0.1-2
CONFLUENT_PLATFORM_MAJOR_VERSION=2.0
CONFLUENT_PLATFORM_VERSION=2.0.1
SCALA_VERSION=2.11.7

project_root := $(realpath $(PWD)/..)

include $(project_root)/Makefile.shared

# build/image: Dockerfile jmx_prometheus_javaagent.jar confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}

# confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}: confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz
# 	tar xvzf $<

# confluent-${CONFLUENT_PLATFORM_VERSION}-${SCALA_VERSION}.tar.gz:
# 	curl -LO http://packages.confluent.io/archive/${CONFLUENT_PLATFORM_MAJOR_VERSION}/$@
# 	shasum -c $@.sha1.txt
