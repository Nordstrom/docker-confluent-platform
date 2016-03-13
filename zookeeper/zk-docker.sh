#!/bin/bash

ZK_CFG_FILE="/etc/kafka/zookeeper.properties"

: ${zk_id:=1}
: ${zk_tickTime:=2000}
: ${zk_initLimit:=5}
: ${zk_syncLimit:=2}
: ${zk_dataDir:="/var/lib/zookeeper"}
: ${zk_clientPort:=2181}
: ${zk_maxClientCnxns:=0}

export zk_id
export zk_tickTime
export zk_initLimit
export zk_syncLimit
export zk_dataDir
export zk_clientPort
export zk_maxClientCnxns
export zk_dataLogDir=${zk_dataLogDir:-"/var/run/zookeeper"}

# Download the config file, if given a URL
if [ ! -z "$zk_cfg_url" ]; then
  echo "[zk] Downloading zk config file from ${zk_cfg_url}"
  curl --location --silent --insecure --output ${zk_cfg_file} ${zk_cfg_url}
  if [ $? -ne 0 ]; then
    echo "[zk] Failed to download ${zk_cfg_url} exiting."
    exit 1
  fi
fi

# Process env variables
echo '# Generated by zk-docker.sh' > ${ZK_CFG_FILE}
for var in $(env | grep -v '^zk_cfg_' | grep '^zk_' | sort); do
  key=$(echo $var | sed -r 's/zk_(.*)=.*/\1/g' | sed -r 's/__/./g')
  value=$(echo $var | sed -r 's/.*=(.*)/\1/g')
  echo "${key}=${value}" >> ${ZK_CFG_FILE}
done

mkdir -p "${zk_dataDir}" "${zk_dataLogDir}"

# Set Zookeeper ID
echo $zk_id > $zk_dataDir/myid

chown -R ${CONFLUENT_GROUP}:${CONFLUENT_USER} \
  /etc/kafka/zk-log4j.properties \
  ${ZK_CFG_FILE} \
  ${zk_dataDir} \
  ${zk_dataLogDir}

/bin/gosu ${CONFLUENT_USER}:${CONFLUENT_GROUP} /usr/bin/zookeeper-server-start ${ZK_CFG_FILE}
