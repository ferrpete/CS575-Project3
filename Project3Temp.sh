#!/bin/bash

# number of threads:
for t in 1 2 4 8
do
	echo NUMT = $t
	
	g++ -DNUMT=$t Project3Temp.cpp -o Project3Temp -lm -fopenmp
	./Project3Temp
done
