branch = main
remote = origin
yumyum = ~/Music/yumyum

outwav = locl.wav


CS_OPTIONS = -Ma




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

