
nchnls = 2
nchnls_i = 2
0dbfs = 1

zakinit 256, 256

#define LIM_s_ON #1#
#include "/orc/lim.orc"

event_i "i", 1, 0, 0

instr 1
Sfile strget 3
inchnls filenchnls Sfile
ifdur filelen Sfile

event_i "i", 2, 0, ifdur, 1, 0 ;left channel out

ichn = (inchnls>1 ? 2 : 1) ;if file is mono duplicate left channel

event_i "i", 2, 0, ifdur, ichn, 1 ;right channel out

event_i "i", 3, ifdur, 0

endin

instr 2
print p4
ain inch p4
zawm ain, p5
endin

instr 3
scoreline_i "e"
endin

