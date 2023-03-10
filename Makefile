branch = main
remote = origin
yumyum = ~/Music/yumyum

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
import:
	git pull $(remote)
