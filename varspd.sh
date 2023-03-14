#!/bin/bash

# Output a file at a different speed

#input
sndf=$1
#speed multiplier
spd=$2
#output
outf=$3

cat f0z.sco > temp.sco
echo "i2106 0 0 3 $spd 0" >> temp.sco

csound -W -o$outf --strset3=$sndf main.orc temp.sco

rm temp.sco
