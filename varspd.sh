#!/bin/bash

sndf=$1
strt=$2
dur=$3
spd=$4

echo "--strset3=$sndf" >> .csound6rc
echo "i67 0 $dur 3 $spd $strt 0 1 0 1" > temp.sco

csound main.orc temp.sco

rm temp.sco
