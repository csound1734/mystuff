## Control output options for csound

When `csound` is called from the command line, without any options, like this:

`csound test.orc test.sco`

... the options saved in the .csound6rc file are used by csound. The Makefile exploits this allowing the user to toggle how csound renders its audio output: either saving the output to disk or sending it to the dac to hear.

* `make odac` will configure csound to render to dac

* `make owav` will configure csound to render to disk (.wav format) 

## Git workflow - using make

### How to add, commit, and push upstream all the latest changes to the (main) branch:
```
make allaboard
make setsail
```

### How to pull the latest changes to the (main) branch:
`make import`

### Working in other branches
Open the Makefile. At the top are definitions of several variables including the variable `branch`. You can change it to the name of the branch you want to work on.
