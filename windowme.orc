
sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1

zakinit 256, 256

#define LIM_s_ON #1#
#include "/orc/lim.orc"

instr 1
Sfile strget p4
ilen = filelen(Sfile)
p3 = ilen
iwtype = p5
iwmax = p6
iwindow ftgen 0,0,8192,-20,iwtype,iwmax
al, ar diskin2 Sfile
aenv tablei phasor:a(1/p3), iwindow, 1
al *= aenv
ar *= aenv
zawm al, 0
zawm ar, 1
endin
