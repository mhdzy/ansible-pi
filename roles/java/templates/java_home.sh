jdkversion=$(ls -al {{ jvm_home }} | grep "^d" | grep "java" | awk '{print $NF}' )
export JAVA_HOME={{ jvm_home }}/$jdkversion