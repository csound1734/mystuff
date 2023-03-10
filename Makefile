branch = main
remote = origin
yumyum = ~/Music/yumyum

outwav = locl.wav




.PHONY : odac
odac:
	echo "-odac" > .csound6rc

.PHONY : owav
owav:
	echo "-W -o $(outwav)" > .csound6rc




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

