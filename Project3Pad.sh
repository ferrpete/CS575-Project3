#!/bin/bash

# number of threads:
for t in 1 2 4 8
do
	echo NUMT = $t
	# number of pads:
	for s in {0..15}
	# for s in 4
	do
		echo NUM = $s
		g++ -DNUM=$s -DNUMT=$t Project3Pad.cpp -o Project3Pad -lm -fopenmp
		./Project3Pad
	done
done
