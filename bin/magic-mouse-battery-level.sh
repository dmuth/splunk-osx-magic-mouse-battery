#!/bin/bash
#
# Print up the battery level of our Magic Mouse
#

# Errors are fatal
set -e

LEVEL=$(ioreg -n "BNBMouseDevice" | grep -i "batterypercent" |grep -v "{" | sed 's/[^[:digit:]]//g')
echo "battery_level=${LEVEL}"


