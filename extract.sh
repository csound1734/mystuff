# input soundfile
input=$1

#offset in seconds
offset=$2

#duration in seconds
duration=$3

# argument to the csound -o flag (example: "dac")
ocsound=$4

echo "i 67 0 $duration 72 1 $offset 1 1 0 1" >> f0z.sco
echo "i 2101 $duration 0" >> f0z.sco
csound --strset72=$input -r96000 -k64 -W -o$ocsound main.orc f0z.sco
echo "f 0 z" > f0z.sco

