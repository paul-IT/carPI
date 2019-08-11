#!/bin/bash
x=`cat file.txt | awk 'NR == 1' | awk '{print $2'}`
#echo "$x"
coproc bluetoothctl
echo -e 'connect '$x '\nexit' >&${COPROC[1]}
output=$(cat <&${COPROC[0]} > file.txt)
end=$(sed -n -e '/Device/p' file.txt)
echo $end


