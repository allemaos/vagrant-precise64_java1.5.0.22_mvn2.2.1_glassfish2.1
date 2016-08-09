#!/bin/sh

#bootstrap file for: java1.5.0.22 mvn2.2.1 glassfish2.1

if [ ! -f glassfish/bin/asadmin ]; then
    echo "Install Env Packages"
    echo "--------------------------------"

    #jdk5
    # wget -nc "https://www.dropbox.com/s/rvhj797qe9uvetv/jdk-1_5_0_22-linux-amd64.bin?dl=0" \
    # -O jdk-1_5_0_22-linux-amd64.bin
    wget -nc "https://dl.dropboxusercontent.com/u/94173687/jdk-1_5_0_22-linux-amd64.bin"
    chmod +x jdk-1_5_0_22-linux-amd64.bin
    yes | sh jdk-1_5_0_22-linux-amd64.bin
    rm -f jdk-1_5_0_22-linux-amd64.bin

    #mvn
    #wget -nc http://apache.cs.uu.nl/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
    #tar -xzvf apache-maven-3.0.5-bin.tar.gz 
    wget -nc https://archive.apache.org/dist/maven/binaries/apache-maven-2.2.1-bin.tar.gz
    tar -xzvf apache-maven-2.2.1-bin.tar.gz
    ##rm -f apache-maven-3.0.5-bin.tar.gz 
    rm  -f apache-maven-2.2.1-bin.tar.gz

    #glassfish
    wget -nc http://download.java.net/javaee5/v2.1_branch/promoted/SunOS_X86/glassfish-installer-v2.1-b60e-sunos_x86.jar
    sudo chmod u+x glassfish-installer-v2.1-b60e-sunos_x86.jar
    echo "A" > temp.out && chmod u+x temp.out
    export JAVA_HOME=/home/vagrant/jdk1.5.0_22
    export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin
    /home/vagrant/jdk1.5.0_22/bin/java -Xmx256m -jar ./glassfish-installer-v2.1-b60e-sunos_x86.jar < temp.out 
    rm -f temp.out
    rm -f glassfish-installer-v2.1-b60e-sunos_x86.jar
    chmod -R +x glassfish/lib/ant/bin
    glassfish/lib/ant/bin/ant -f glassfish/setup.xml

    #env
    echo 'export JAVA_HOME=/home/vagrant/jdk1.5.0_22' >> /home/vagrant/.bashrc
    #echo 'export M2_HOME=/home/vagrant/apache-maven-3.0.5' >> /home/vagrant/.bashrc
    echo 'export M2_HOME=/home/vagrant/apache-maven-2.2.1' >> /home/vagrant/.bashrc
    echo 'export MAVEN_OPTS="-Xmx1024m -Xms256m -XX:MaxPermSize=512m -Dfile.encoding=utf-8"' >> /home/vagrant/.bashrc
    echo 'export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin' >> /home/vagrant/.bashrc

fi

echo "glassfish starting domain "
echo "----------------------------------------------------------------------"
/home/vagrant/glassfish/bin/asadmin start-domain --verbose