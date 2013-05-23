#!/bin/sh
set -efu

Combine()
{
perl -ane '
	for (@F) {
		if    (/^\+(\d+)!/)  { $sum += $1; }
		elsif (/^\+(\d+)$/)  { $sum += $1; }
		elsif (/^\((\d+)\)/) { $total = $1; }
	}
	END {
		print "$sum\t$total\n";
	}
'
}


for y in `seq 2005 2013`; do
for m in January February March April May June July August September October November December; do
	url=http://lists.altlinux.org/pipermail/sisyphus-cybertalk/$y-$m/thread.html
	if GET "$url" |grep -o "I: Sisyphus-$y.... packages: .* ([1-9][0-9]*)" >month-data; then
		printf '%s-%s\t' $y $m
		Combine <month-data
	else
		echo >&2 "no data for $m $y"
	fi
done
done
