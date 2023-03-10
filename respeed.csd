<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	48000
ksmps	=	1
nchnls	=	2
0dbfs	=	1

zakinit 256, 256

#define LIM_s_ON #1#
#include "/orc/lim.orc"

instr 1	
Sfile strget p4
ispeed = $SPEED
p3 = filelen(Sfile)/ispeed
al, ar diskin2 Sfile, ispeed
zawm al, 0
zawm ar, 1
endin

</CsInstruments>
; ==============================================
<CsScore>

i 1 0 1 3



</CsScore>
</CsoundSynthesizer>

