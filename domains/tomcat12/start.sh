#!/bin/sh
export CATALINA_HOME=/svc/tomcat/tomcat-8.5
export CATALINA_BASE=/svc/tomcat/domains/tomcat12
export CATALINA_OPTS="-Denv=product -Denv.servername=tomcat12 "
export CATALINA_OPTS=" $JAVA_OPTS -Djboss.mod_cluster.jvmRoute=tomcat12 "

#export AGENT_PATH=/svc/pinpoint/pinpoint-agent
#export JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true "
#export JAVA_OPTS="$JAVA_OPTS -javaagent:$AGENT_PATH/pinpoint-bootstrap-1.8.5.jar "
#export JAVA_OPTS="$JAVA_OPTS -Dpinpoint.agentId=tomcat12 -Dpinpoint.applicationName=Tomcat12 "
export JAVA_OPTS="${JAVA_OPTS} -Dorg.apache.catalina.JSESSIONID=YSESSIONID"
export JAVA_OPTS="$JAVA_OPTS -javaagent:/etc/apm-agent/elastic-apm-agent-1.12.0.jar"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.service_name=tomcat12"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.server_url=http://192.168.110.145:8200"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.secret_token= "
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.application_packages=org.apache.jsp"

#export JAVA_OPTS=" $JAVA_OPTS -javaagent:/svc/scouter/agent.java/scouter.agent.jar"
#export JAVA_OPTS=" $JAVA_OPTS -Dscouter.config=/svc/scouter/agent.java/conf/tomcat11.conf"
#export JMX_OPTS="-Dcom.sun.management.jmxremote \
#                 -Dcom.sun.management.jmxremote.port=8090 \
#                 -Dcom.sun.management.jmxremote.authenticate=false \
#                 -Dcom.sun.management.jmxremote.ssl=false \
#                 -Djava.rmi.server.hostname=192.168.110.131 "
export CATALINA_OPTS=" ${JMX_OPTS} ${CATALINA_OPTS}"
cd $CATALINA_HOME/bin
./startup.sh
