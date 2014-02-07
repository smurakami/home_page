#!/bin/bash

psdfile=$1
width=$2
height=$3

file=`echo $psdfile | sed -e s/.psd//g`

convert $file.psd $file.png
mv ${file}-0.png $file.png
if [ $# -ge 2 ]
  then
  if [ $# -eq 2]
    then
    heght=$width
  fi
  convert -geometry ${width}x${height} $file.png $file.png
fi

rm ${file}-*.png




# for file in chara*-0.png
# do
#   convert -geometry 500x500 $file $file
# done

# for file in chara*-0.png
# do
#   mv $file ../img/`echo $file | sed -e s/-0//g`
# done