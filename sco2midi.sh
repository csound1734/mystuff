#!/bin/bash

# Score file input
scofil=$1
# instr # select (i statements will be written with this value for p1 in the score output)
instr=$2
# MIDI output file
midfil=$3

csound -ozzzzz -m0 -r96000 -k64 --omacro:MAKE_MIDI_FROM_SCORE=1 --midioutfile=$midfil main.orc $scofil
open .
rm zzzzz
