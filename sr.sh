#!/bin/bash

infi=$1
sr=$2
outf=$3

csound -W -o$outf -r$sr --strset3=$infi -i $infi --orc srconv.orc

