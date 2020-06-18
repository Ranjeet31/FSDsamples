#nux-x64.tar.gz Copyright (c) 2017, 2020 Oracle and/or its affiliates.
#
# Licensed under the Universal Permissive License v 1.0 as shown at
# https://oss.oracle.com/licenses/upl

#!/bin/bash

#set -x
export WCSITES_MATTESTS_ZIP=http://slc16cfh.us.oracle.com/matstest.zip ## will update url once transaction merged.
export ANT_JUNIT=http://mirror.centos.org/centos/7/os/x86_64/Packages/ant-junit-1.9.4-2.el7.noarch.rpm
export JDK_SOURCE=http://slc16cfh.us.oracle.com/jdk-8u241-linux-x64.tar.gz
export SampleData=http://slc16cfh.us.oracle.com/SampleData.zip
#Environment settings
yum install -y wget
yum install -y tar
yum install -y gzip 
yum install -y unzip 
yum install -y ant 
yum install -y csh
yum install -y vim 
#Below install is being kept for the time being (Ranjeet Kumar)
#yum install -y tigervnc-server 
yum install -y freetype 
yum install -y fontconfig 
yum install -y libXrender 
yum install -y libXcomposite 
yum install -y alsa-lib 
yum install -y dbus-glib 
yum install -y gtk3 
yum install -y libXt 
yum install -y xorg-x11-server-Xvfb 
   
wget ${WCSITES_MATTESTS_ZIP} -O /tmp/matstest.zip
wget ${JDK_SOURCE} -O /tmp/jdk-8u241-linux-x64.tar.gz
wget ${SampleData} -O /tmp/SampleData.zip
#wget ${VNC_TOOL_ZIP} -O /tmp/vnctool.zip
#wget ${FIREFOX_ZIP} -O /tmp/firefox.zip
wget ${ANT_JUNIT}  -O /tmp/ant-junit-1.9.4-2.el7.noarch.rpm
yum install -y  /tmp/ant-junit-1.9.4-2.el7.noarch.rpm

    
cd /u01
#unzip /tmp/testtool.zip

cp /u01/oracle/wcsites/webcentersites/sites-home/sites.war /tmp
#chown -R 1000:1000 /u01/oracle/wcsites/webcentersites/sites-home/Sites
#chmod 777 -R /u01/oracle/wcsites/webcentersites/sites-home/Sites
mkdir workplace
cd /u01/workplace
tar -xzvf /tmp/jdk-8u241-linux-x64.tar.gz
unzip /tmp/SampleData.zip
unzip /tmp/matstest.zip
#unzip /tmp/vnctool.zip
#unzip /tmp/firefox.zip

#chmod 777 -R /u01
echo "before wcssitesmatrunner.sh"

sh /u01/wcssitesmatrunner.sh | tee /u01/wcssitesmatrunner.sh

echo "after wcssitesmatrunner.sh"

exec "$@"
