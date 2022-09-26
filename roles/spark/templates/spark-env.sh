source "{{ commands_file }}"

export JAVA_HOME="$(readlink -f /usr/bin/java | sed 's:bin/java::' | sed 's/\/$//')"
pathappend "$JAVA_HOME/bin" "$JAVA_HOME/jre"

# path and options for Hadoop
export HADOOP_HOME="{{ hadoop_home }}"
export HADOOP_LOG_DIR="$HADOOP_HOME/logs"
pathappend "$HADOOP_HOME/bin" "$HADOOP_HOME/sbin"

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
ldpathappend "$HADOOP_HOME/lib/native"
export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
export HADOOP_OS_TYPE="${HADOOP_OS_TYPE:-$(uname -s)}"

# =====
# spark, hive, zookeeper, kafka
export SPARK_HOME="{{ spark_home }}"
# this variable (as we set it) is automatically derived by Spark
# export SPARK_CONF_DIR="{{ spark_conf_dir }}"
export SPARK_MASTER_HOST="{{ master_ip }}"
pathappend "$SPARK_HOME/bin" "$SPARK_HOME/sbin"

# export HIVE_HOME=/opt/hive
# pathappend "$HIVE_HOME/bin"

# export ZOOKEEPER_HOME=/opt/zookeeper
# pathappend "$ZOOKEEPER_HOME/bin" "$ZOOKEEPER_HOME/sbin"

# export KAFKA_HOME=/opt/kafka
# pathappend "$KAFKA_HOME/bin" "$KAFKA_HOME/sbin"
