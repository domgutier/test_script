#!/bin/bash
#Parameters for CTFFIND4
pxsize=1.07
voltage=300
cs=2.0
ac=0.07
box=400
minA=50.0
maxA=6.2
mindf=5000.0
maxdf=60000.0
step=500
ast=100
addphaseshift="no"

input=$name".mrc"
echo $input
output=$name"_out.mrc"
echo $output

for input_fn in /home/amedee/relion21_tutorial/betagal/MotionCorr/job009/Micrographs/*.mrc
do
/programs/x86_64-linux/ctffind4/4.1.5/bin/ctffind > gc_${i%.mrc}_sum_ctffind4_orig.log << eof
$input_fn
$output
$pxsize
$voltage
$cs
$ac
$box
$minA
$maxA
$mindf
$maxdf
$step
$ast
$addphaseshift
eof
done
