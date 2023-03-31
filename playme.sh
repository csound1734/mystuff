#!/bin/bash

# Just play a sound and then end performance

# The sound
infi=$1

# score an instrument that will do everything automatically
echo "i2104 0 0 2104" > temp.sco
# need this line
echo "f 0 z" >> temp.sco
# Csound
csound --env:SFDIR+=Users/nicoleangelaschmidt/Music/germcity/siland -W -odac -r96000 -k64 --strset2104=$infi main.orc temp.sco
# cleanup
rm temp.sco
