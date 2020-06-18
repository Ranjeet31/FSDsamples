# Copyright (c) 2017, 2020 Oracle and/or its affiliates.
#
# Licensed under the Universal Permissive License v 1.0 as shown at
# https://oss.oracle.com/licenses/upl
# Author : Srikanth Manikanti <srikanth.manikanti@oracle.com>
#!/bin/bash

# set the env variables from the list of available config map variables
#WCP_HOSTNAME=$MANAGED_SERVER_NAME_SVC
#WCP_PORT=$MANAGED_SERVER_PORT
#WEBLOGIC_PORT=$ADMIN_PORT
#WEBLOGIC_HOST=$ADMIN_SERVER_NAME_SVC
#WEBLOGIC_PASSWORD=$ADMIN_PASSWORD

export HOST_IP_ADDRESS=$(hostname --ip-address) 
export ADE_VIEW_ROOT=/u01
export T_WORK=$ADE_VIEW_ROOT/workplace
export testroot_dir=$ADE_VIEW_ROOT/workplace/mats
#export SRC=$testroot_dir/wctest/functional
#export buildxml="$SRC/$1/build.xml"
#export testtool=$ADE_VIEW_ROOT/testtool
#export wls_admin_host=$WCP_HOSTNAME
export JAVA_HOME=$T_WORK/jdk1.8.0_241
export PATH=$JAVA_HOME/bin:$PATH
export testout=/u01/oracle/wcsitestest/testout


#mkdir $LOG_DIRECTORY/test-logs -p

echo HOST IP ADDRESS : $HOST_IP_ADDRESS
#echo HOSTNAME : $HOSTNAME

echo "Before ant"
#java -version
#ant -version
startDate=$(date '+%d-%h-%Y %T')

echo "Triggering mat Testcases for wcsites"
cd $testroot_dir

ant -f runjunit.xml | tee matrun_logs.log

echo "After ant"

echo "MATS Start and END Date "
#cat $T_WORK/matsaudittime.log

echo "After complete test run"

cd -

#cp $ADE_VIEW_ROOT/workplace/*.xml $testout

cp *.log $testout

#echo "Copying Test results to" $LOG_DIRECTORY
#cp $testout $LOG_DIRECTORY/test-logs/ -R
#cp *.suc $LOG_DIRECTORY/test-logs/
#cp *.dif $LOG_DIRECTORY/test-logs/
#cp *.skip  $LOG_DIRECTORY/test-logs/


echo Tests completed

