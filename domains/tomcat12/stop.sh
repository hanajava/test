#!/bin/sh
export CATALINA_HOME=/svc/tomcat/tomcat-8.5
export CATALINA_BASE=/svc/tomcat/domains/tomcat12
export CATALINA_OPTS="-Denv=product -Denv.servername=tomcat12"
cd $CATALINA_HOME/bin
./shutdown.sh
