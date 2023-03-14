#!/bin/bash

# Convert any sound file to an arbitrary sample rate

# Command arguments: declare input file
infi=$1
# declare new sample rate (eg 48000)
sr=$2
# declare output file
outf=$3

# Score to automatically determine length of soundfile and schedule playback
echo "i2104 0 0 2104" > temp.sco
# This line needs to be included or csound does nothing
echo "f 0 z" >> temp.sco
# Csound
csound -W -o$outf -r$sr --strset2104=$infi main.orc temp.sco
# Cleanup
rm temp.sco

