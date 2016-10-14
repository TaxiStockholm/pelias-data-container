#!/bin/bash

# errors should break the execution
set -e

mkdir -p $DATA/openaddresses
cd $DATA/openaddresses

# Download all '/se/' entries from OpenAddresses
curl -sS http://results.openaddresses.io/state.txt | sed -e 's/\s\+/\n/g' | grep '/se/.*\.zip' | xargs -n 1 curl -O -sS
ls *.zip | xargs -n 1 unzip -o
rm *.zip README.*

echo 'OK' >> /tmp/loadresults
