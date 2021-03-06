#!/bin/bash

# errors should break the execution
set -e

# param: zip name containing gtfs data
function import_gtfs {
    unzip -o $1
    prefix=$(echo $1 | sed 's/.zip//g')
    prefix=${prefix^^}
    node $TOOLS/pelias-gtfs/import -d $DATA/sweden --prefix=$prefix
}

cd $DATA/sweden
targets=(`ls *.zip`)
for target in "${targets[@]}"
do
    import_gtfs $target
done

#import openaddresses data
cd  $TOOLS/openaddresses

# first import swedish OA docs
bin/parallel 2 --language=sv

# then import and merge fi data with sv docs
# bin/parallel 2 --language=fi --merge --merge-fields=name

echo 'OK' >> /tmp/indexresults
