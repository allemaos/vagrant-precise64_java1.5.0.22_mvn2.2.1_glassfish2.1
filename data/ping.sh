#!/bin/bash

VERSION='--verbose'
TEST=`echo "$VERSION" | sed 's/-//g'`
echo $TEST

TAT=`echo $1 | tr --delete .`
echo $TAT

#ping svn.vci.gr

if [ -z "$VAR" ]; then
   echo "VAR is unset or set to the empty string"

fi 

if [[ $JAVA_HOME ]]; then
    echo "JAVA_HOME is unset or set to the empty string"
fi 

