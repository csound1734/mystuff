
nchnls = 2
0dbfs = 1

zakinit 256, 256

#define LIM_s_ON #1#
#include "/orc/lim.orc"

;scoreline_i "i 1038 0 0"
instr 1038
Sresult[] directory "./shlob", ".sco"
printf_i "%s\n", 1, Sresult[0]
icount = 0
loop:
if icount!=-1 then
Sscore, icount readfi Sresult[0]
printf_i "%s\n", 1, Sscore
scoreline_i Sscore
igoto loop
endif
endin

instr 1001
ares[] diskin strget(p4), p5, p6, p7
iamp = p8
inchnls = lenarray(ares)
zawm ares[0]*iamp, 0
ichn = (inchnls > 1 ? 1 : 0)
zawm ares[ichn]*iamp, 1
endin
