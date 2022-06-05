
if [[ -z "$SPARK_SETUP_FLAG" ]]; then
  # path and options for java
  export JAVA_HOME="$(readlink -f /usr/bin/java | sed 's:bin/java::' | sed 's/\/$//')"
  export PATH="$JAVA_HOME/bin:$JAVA_HOME/jre:$PATH"

  # path and options for Hadoop
  export HADOOP_HOME={{ hadoop_home }}
  export HADOOP_LOG_DIR="$HADOOP_HOME/logs"
  export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH"
  
  # yarn stuff
  export YARN_HOME="$HADOOP_HOME"

  export HADOOP_INSTALL="$HADOOP_HOME"
  export HADOOP_MAPRED_HOME="$HADOOP_HOME"
  export HADOOP_COMMON_HOME="$HADOOP_HOME"
  export HADOOP_HDFS_HOME="$HADOOP_HOME"
  export HADOOP_INSTALL="$HADOOP_HOME"
  export HADOOP_COMMON_LIB_NATIVE_DIR="$HADOOP_HOME/lib/native"
  export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"

  # extras for Spark compatability
  export LD_LIBRARY_PATH="$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH"
  export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
  export HADOOP_OS_TYPE="${HADOOP_OS_TYPE:-$(uname -s)}"

  # =====
  # spark, hive, zookeeper, kafka
  export SPARK_HOME={{ spark_home }}
  # this variable (as we set it) is automatically derived by Spark
  # export SPARK_CONF_DIR={{ spark_conf_dir }}
  export SPARK_MASTER_HOST={{ master_ip }}
  export PATH="$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH"

  # export HIVE_HOME=/opt/hive
  # export PATH="$HIVE_HOME/bin:$PATH"

  # export ZOOKEEPER_HOME=/opt/zookeeper
  # export PATH="$ZOOKEEPER_HOME/bin:$ZOOKEEPER_HOME/sbin:$PATH"

  # export KAFKA_HOME=/opt/kafka
  # export PATH="$KAFKA_HOME/bin:$KAFKA_HOME/sbin:$PATH"
fi

export SPARK_SETUP_FLAG=1
