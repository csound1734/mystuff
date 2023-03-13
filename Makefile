branch = main
remote = origin
yumyum = ../yumyum

outwav = locl.wav


CS_OPTIONS = -Ma




.PHONY: shlob
shlob: shlob.orc ../germcity/r/r.wav shlob/1.sco
	csound -r96000 -k64 --strset3=../germcity/r/r.wav shlob.orc shlob/1.sco




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

