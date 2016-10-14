#!/bin/bash

# errors should break the execution
set -e

# Download gtfs stop data
cd $DATA
curl -sS -o sweden.zip https://api.resrobot.se/gtfs/sweden.zip?key=b589ebfd-f7f5-4fdb-b90e-43188945f826
unzip sweden.zip

echo 'OK' >> /tmp/loadresults
