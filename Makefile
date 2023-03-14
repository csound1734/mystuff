branch = main
remote = origin
yumyum = ../yumyum

inwav = inpu.wav
outwav = locl.wav

basic = f0z.sco main.orc


CS_OPTIONS = -Ma



laststep = bash playme.sh




locl10.wav : $(basic) locl2.wav
	echo "f1 0 0 1 \"locl2.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"locl2.wav\" 0 0 2" >> f0z.sco
	echo "i 2115 0 0 3 1 2 .3 0.75" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=locl2.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@

locl5.wav : $(basic) locl4.wav
	echo "f1 0 0 1 \"locl4.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"locl4.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .1" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=locl4.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@

locl4.wav : $(basic) locl3.wav
	echo "f1 0 0 1 \"locl3.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"locl3.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .2" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=locl3.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@

locl3.wav : $(basic) locl2.wav
	echo "f1 0 0 1 \"locl2.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"locl2.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .2" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=locl2.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@

locl2.wav : $(basic) locl.wav
	echo "f1 0 0 1 \"locl.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"locl.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .3" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=locl.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@

locl.wav : $(basic) drcl.wav
	bash varspd.sh drcl.wav .2 temp.wav
	echo "f1 0 0 1 \"drcl.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"drcl.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .3" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=temp.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@
	rm temp.wav




dr2.wav : dr1.wav
	echo "f1 0 0 1 \"dr1.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"dr1.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .2" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=drz.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@

dr1.wav :
	echo "f1 0 0 1 \"drx.wav\" 0 0 1" >> f0z.sco
	echo "f2 0 0 1 \"drx.wav\" 0 0 2" >> f0z.sco
	echo "i 2105 0 0 3 1 2 .45" >> f0z.sco
	csound -r96000 -k64 -W -o$@ --strset3=drz.wav main.orc f0z.sco
	echo "f 0 z" > f0z.sco
	$(laststep) $@
	




cv2.wav : cv1.wav cv1a.wav f0z.sco main.orc
	cat f0z.sco > temp.sco
	echo "f1 0 0 1 \"cv1.wav\" 0 0 1" >> temp.sco
	echo "f2 0 0 1 \"cv1.wav\" 0 0 2" >> temp.sco
	echo "i2105 0 0 3 1 2 .1" >> temp.sco
	csound -W -o$@ -r96000 -k64 --strset3=cv1a.wav main.orc temp.sco
	rm temp.sco
	$(laststep) $@

cv1a.wav : cv1.wav f0z.sco main.orc
	bash varspd.sh cv1.wav 1.3333333333333 $@
	$(laststep) $@
	
cv1.wav : cl1.wav cl2.wav f0z.sco main.orc
	cat f0z.sco > temp.sco
	echo "f1 0 0 1 \"cl2.wav\" 0 0 1" >> temp.sco
	echo "f2 0 0 1 \"cl2.wav\" 0 0 2" >> temp.sco
	echo "i2105 0 0 1 1 2 .3" >> temp.sco
	csound -W -o$@ -r96000 -k64 --strset1=cl1.wav main.orc temp.sco
	rm temp.sco
	$(laststep) $@

cl1.wav : main.orc
	echo "i67 0 0.37 3 1.40 6 0 1 0 1" > temp.sco
	csound -W -o$@ -r96000 -k64 --strset3=../germcity/r/r.wav main.orc temp.sco
	rm temp.sco
	$(laststep) $@

cl2.wav : main.orc
	echo "i67 0 0.37 3 -.75 15.6 0 1 0 1" > temp.sco
	csound -W -o$@ -r96000 -k64 --strset3=../germcity/r/r.wav main.orc temp.sco
	rm temp.sco
	$(laststep) $@



.PHONY: main
main: main.orc
	csound $(CS_OPTIONS) main.orc


.PHONY: shlob
shlob: shlob.orc ../germcity/r/r.wav shlob/1.sco
	csound $(CS_OPTIONS) --strset3=../germcity/r/r.wav shlob.orc shlob/1.sco





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




.PHONY: cleanintrm
cleanintrm:
	rm intrm/*
.PHONY: cleanwav
cleanwav:
	rm *.wav

.PHONY: cleantest
cleantest:
	rm test*

.PHONY: cleanlocl
cleanlocl:
	rm locl*

.PHONY: cleancs
cleancs:
	rm .csound6rc

