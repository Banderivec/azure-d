#!/bin/sh

target=`cat target.txt`
connection=1000
time=3600s

if [ ! -z "$target" ]; then
	echo "Run new bombardier: $target"
	docker run --rm -it -d alpine/bombardier -c $connection -d $time -l $target
else
	echo "Stop all bombardiers"
	docker ps -a -q  --filter ancestor=alpine/bombardier
fi

exit 0

