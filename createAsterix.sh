#!/bin/bash
cd ..
rm -rf asterix-mgmt
mkdir asterix-mgmt
cd asterix-mgmt
unzip ../asterix-installer-0.9.2-SNAPSHOT-binary-assembly.zip
export MANAGIX_HOME=`pwd`
export PATH=$PATH:$MANAGIX_HOME/bin
rm conf/asterix-configuration.xml
cp ../mainScripts/asterix-configuration.xml conf/
rm clusters/local/local.xml
cp ../mainScripts/local.xml clusters/local/
managix create -n my_asterix -c $MANAGIX_HOME/clusters/local/local.xml
cd ../mainScripts
