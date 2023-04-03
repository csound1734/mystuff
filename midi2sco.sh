#!/bin/bash

# MIDI file input
midfil=$1
# instr # select (i statements will be written with this value for p1 in the score output)
instr=$2
# score output file
scofil=$3

csound -ozzzzz -m0 -r96000 -k64 -T --midi-velocity=4 --midi-key=5 -F $midfil --omacro:MAKE_SCORE_FROM_MIDI=\"$scofil\" --omacro:MAKE_SCORE_P1="$instr" --orc main.orc
# sed '1 s/^ i 141 [0-9]*.[0-9]*/ i 141 0.000000/' <temp2.sco >$scofil
cat $scofil
rm zzzzz
