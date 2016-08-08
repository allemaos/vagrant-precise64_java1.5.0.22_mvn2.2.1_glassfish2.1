#!/bin/sh

export JAVA_HOME=/home/vagrant/jdk1.5.0_22
export M2_HOME=/home/vagrant/apache-maven-2.2.1
export MAVEN_OPTS="-Xmx1024m -Xms256m -XX:MaxPermSize=512m -Dfile.encoding=utf-8"
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin

echo "Full remove and reinstall glassfish server"
echo "------------------------------------------------------------"
echo "REMOVE GLASSFISH"
rm -rf glassfish

echo "INSTALL GLASSFISH"
#glassfish
wget -nc http://download.java.net/javaee5/v2.1_branch/promoted/SunOS_X86/glassfish-installer-v2.1-b60e-sunos_x86.jar
sudo chmod u+x glassfish-installer-v2.1-b60e-sunos_x86.jar
echo "A" > temp.out && chmod u+x temp.out
/home/vagrant/jdk1.5.0_22/bin/java -Xmx256m -jar ./glassfish-installer-v2.1-b60e-sunos_x86.jar < temp.out 
rm -f temp.out
rm -f glassfish-installer-v2.1-b60e-sunos_x86.jar
chmod -R +x glassfish/lib/ant/bin
glassfish/lib/ant/bin/ant -f glassfish/setup.xml
echo "GLASSFISH STARTING DOMAIN"
echo "--------------------------------------------------"
/home/vagrant/glassfish/bin/asadmin start-domain --verbose

