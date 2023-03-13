
	nchnls = 2
	0dbfs = 1

zakinit 256, 256

#define LIM_s_ON #1#
#include "/orc/lim.orc"

instr 67
ares[] diskin strget(p4), p5, p6, p7
iamp = p8
inchnls = lenarray(ares)		;DETECT STEREO
zawm ares[0]*iamp, 0			;FIRST CHANNEL OUT (Z)
ichn = (inchnls > 1 ? 1 : 0)		;DETECT STEREO
zawm ares[ichn]*iamp, 1			;MONO OR STEREO OUT (Z) 
endin


