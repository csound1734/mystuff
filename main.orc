
	nchnls = 2
	0dbfs = 1

zakinit 256, 256

#define LIM_s_ON #1#
#include "/orc/lim.orc"

	instr 	67 ;playback sound from disk; basic opcode control
ares[] 	diskin 	    strget(p4), p5, p6, p7	;File, speed, offset, wraparound
iamp 	= 	    p8
inchnls = 	    lenarray(ares)		;DETECT STEREO
	printf_i    "\n\nNOW PLAYING\nCHANNELS: %d\n\n\n", 1, inchnls
zawm 		    ares[0]*iamp, p9		;FIRST CHANNEL OUT (Z)
ichn 	= 	    (inchnls > 1 ? 1 : 0)	;DETECT STEREO
zawm 		    ares[ichn]*iamp, p10		;MONO OR STEREO OUT (Z) 
	endin

	instr 	68 ;like instr 67 but with one master window based on GEN 20

	if p11==0 then ;p12=0 if you want to clear the input a-variable with zacl opcode
	event_i	    "i", 2103, 0, p3, p9, p10 ;turns on instr 2103 which contains zacl
	endif

izk_out	=	    p4
izk_ou2 = 	    p5
iwind_T	=	    p6
iwind_1 =	    p7
iwind_2	=	    p8
izk_in	=	    p9
izk_in2	=	    p10
print	izk_in
print	izk_in2

ainl	zar	    izk_in
ainr	zar	    izk_in2

iwind	ftgentmp    0,0,65537,20, iwind_T, 1, iwind_1, iwind_2
awind	tablei	    phasor:a(divz:i(1,p3,10000)), iwind, 1, 0, 0
ainl	*=	    awind
ainr	*=	    awind

	zawm	    ainl, izk_out
	zawm	    ainr, izk_ou2
	;printk	    .1, downsamp(awind)
	endin

	instr 	69
izk_out	=	    p4
izk_ou2	=	    p5

i_irL	=	    p6	;LEFT IMPULSE RESPONSE
i_irR	=	    p7	;RIGHT IMPULSE RESPONSE

igain	=	    p8	;AMP MULTIPLIER
igain	*=	    igain

izk_in	=	    p9
izk_in2	=	    p10

ain_l	zar	    izk_in
ain_r	zar	    izk_in2
al	ftconv	    ain_l, i_irL, 1024
ar	ftconv	    ain_r, i_irR, 1024
	zawm	    al*igain, izk_out
	zawm	    ar*igain, izk_ou2
	endin

instr 2101 ;end performance (e statement in score)
scoreline_i "e"
endin

	instr	2103 ;ZACL wrapped in an instr
print	p3
print	p4
print	p5
zacl	p4, p5
	endin

	instr 	2104 ;automatically play a file and then end perf.
Sfile	strget	    p4
inchnls filenchnls Sfile
ifdur filelen Sfile
event_i "i", 67, 0, ifdur, p4, 1, 0, 0, 1, 0, 1 ;instr 67 plays sound
event_i "i", 2101, ifdur, 0 ;end performance afterwards
	endin
