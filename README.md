## Projects

`make locl5.wav`

## Csound utilities

### Play a (stereo or mono) sound with automatic ending
`bash playme.sh file.wav`

### Convert a soundfile to a different sample rate
`bash sr.sh in.wav 96000 out.wav` converts the file `in.wav` to 96k

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
