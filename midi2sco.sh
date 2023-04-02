#!/bin/bash

# MIDI file input
midfil=$1
# instr # select (i statements will be written with this value for p1 in the score output)
instr=$2
# score output file
scofil=$3

csound -ozzzzz -r96000 -k64 -T --midi-velocity=4 --midi-key=5 -F $midfil --omacro:MAKE_SCORE_FROM_MIDI=\"$scofil\" --omacro:MAKE_SCORE_P1="$instr" --orc main.orc
cat $scofil
rm zzzzz
