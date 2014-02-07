#!/bin/bash

for file in chara*.psd
do
  convert $file `echo $file | sed -e s/.psd/.png/g`
  for i in `seq 1 3`
  do
    rm chara*-${i}.png
  done
done

for file in chara*-0.png
do
  convert -geometry 500x500 $file $file
done

for file in chara*-0.png
do
  mv $file ../img/`echo $file | sed -e s/-0//g`
done