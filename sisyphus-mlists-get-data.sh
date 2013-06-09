#!/bin/sh
set -efu

for l in devel sisyphus community; do
for y in `seq 2001 2013`; do
for m in January February March April May June July August September October November December; do
	url=http://lists.altlinux.org/pipermail/$l/$y-$m/thread.html
	if GET "$url" |grep -m1 -o ':</b> [0-9][0-9]*<p>' >month-data; then
		printf '%s-%s\t' $y $m
		awk '{print+$2}' <month-data
	else
		echo >&2 "no data for $l $m $y"
	fi
done
done |tee mlist-$l-data
done
