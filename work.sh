#!/bin/bash

echo "-W --orc -r48000 -k1000 --strset3=inpu.wav" > .csound6rc
echo "{4 x" > temp.sco
echo "i67 0 12 3 [-1.5-.5*~] [~*23] 1 .08 2 3" >> temp.sco
# echo "i67 0 12 3 [1.50+.5*~] [~*23] 1 .08 0 1" >> temp.sco
echo "}" >> temp.sco

#Convolution
# - load impulse responses (left and right)
echo "f 17 0 [0] 1 \"inpu.wav\" 0 0 1" >> temp.sco
echo "f 18 0 [0] 1 \"inpu.wav\" 0 0 2" >> temp.sco
# - call the convolution algorithm (instr 69)
echo "i 69 0 12 0 1 17 18 .5 2 3" >> temp.sco
# - clear z-channels meanwhile
echo "i 2103 0 12 2 3" >> temp.sco
csound -o locl1.wav main.orc temp.sco

rm temp*

open .
