branch = main
remote = origin
yumyum = ../yumyum

inwav = inpu.wav
outwav = locl.wav


CS_OPTIONS = -Ma




.PHONY: main
main: main.orc
	csound $(CS_OPTIONS) main.orc


.PHONY: shlob
shlob: shlob.orc ../germcity/r/r.wav shlob/1.sco
	csound $(CS_OPTIONS) --strset3=../germcity/r/r.wav shlob.orc shlob/1.sco




.PHONY : layer
layer: under.wav
	echo "-i under.wav" >> .csound6rc

.PHONY : sr96k
sr96k :
	echo "-r96000" >> .csound6rc

.PHONY : sr48k
sr48k :
	echo "-r48000" >> .csound6rc

.PHONY : sr44k
sr44k :
	echo "-r44100" >> .csound6rc

.PHONY : kr1000
kr1000 :
	echo "-k1000" >> .csound6rc

.PHONY : kr64
kr64 :
	echo "-k64" >> .csound6rc

.PHONY : str3l
str3l:
	echo "--strset3=$(inwav)" >> .csound6rc

.PHONY : stdi
stdi:
	echo "-L stdin" >> .csound6rc

.PHONY : orca
orca:
	echo "--orc" >> .csound6rc

.PHONY : odac
odac:
	echo "-odac $(CS_OPTIONS)" > .csound6rc

.PHONY : owav
owav:
	echo "-W -o $(outwav) $(CS_OPTIONS)" > .csound6rc




puff.txt : $(yumyum)
	cat $(yumyum) > $@

.PHONY: allaboard
allaboard:
	git add -A
	git commit -a -m "commit by make"	

.PHONY: setsail
setsail: puff.txt
	git push -u $(remote) $(branch)

.PHONY: import
import: puff.txt
	git pull $(remote)




.PHONY: cleanwav
cleanwav:
	rm *.wav

.PHONY: cleantest
cleantest:
	rm test*

.PHONY: cleanlocl
cleanlocl:
	rm locl*

