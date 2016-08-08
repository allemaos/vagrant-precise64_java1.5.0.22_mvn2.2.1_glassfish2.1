#!/bin/sh

export JAVA_HOME=/home/vagrant/jdk1.5.0_22
export M2_HOME=/home/vagrant/apache-maven-2.2.1
export MAVEN_OPTS="-Xmx1024m -Xms256m -XX:MaxPermSize=512m -Dfile.encoding=utf-8"
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin

/home/vagrant/glassfish/bin/asadmin stop-domain $1
