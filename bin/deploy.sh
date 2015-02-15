#!/bin/bash
#
# "Deploy" this app by copying this app to $SPLUNK_HOME/etc/apps/OSX-Magic-Mouse-Battery
#

#set -x # Debugging

#
# Errors are fatal
#
set -e 


if test ! "$1"
then
	echo "Syntax: $0 \$SPLUNK_ROOT"
	exit 1
fi

SPLUNK_ROOT=$1
TARGET=${SPLUNK_ROOT}/etc/apps
FILENAME="OSX-Magic-Mouse-Battery"

#
# Change into the parent directory of this script
#
cd `dirname $0`
cd ..
DIR=`pwd`

#
# Now make a symlink under the apps directory to this directory
#
pushd $TARGET > /dev/null

if test -r $FILENAME
then
	echo "# " 
	echo "# File ${TARGET}/${FILENAME} already exists. Aborting." 
	echo "# " 
	exit
fi

cp -rv $DIR $FILENAME

echo "# "
echo "# Copied contents of ${DIR} to ${TARGET}/${FILENAME}"
echo "# "

