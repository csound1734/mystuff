#!/bin/bash

# Csound -o command line flag option: for example, -odac, -omyOutput.wav
# do not include the "-o" so dac, MyOutput.wav work
ocsound=$4
# More csound options: srate and krate set sr and kr with -s and -k flags
srate=$5
krate=$6

# The two input soundfiles
file1=$1
file2=$2

# amp factor
amp=$3

# setup score
echo "f1 0 0 1 \"$file1\" 0 0 1" >> f0z.sco
echo "f2 0 0 1 \"$file1\" 0 0 2" >> f0z.sco

# call the automatic covolution instrument.
# 
# p4 - strsget # to communicate filename (use 3)
# p5, p6 - the two f-tables with left and right impulse respose (1 & 2)
# p6 -
# p7 - amp factor. this will actually be squared
echo "i 2105 0 0 3100 1 2 $amp" >> f0z.sco
csound -r$srate -k$krate -W -o$ocsound --strset3100=$file2 main.orc f0z.sco

# restore default score
echo "f 0 z" > f0z.sco

