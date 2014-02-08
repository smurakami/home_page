for dir in js_*; do
  mv $dir `echo $dir | sed -e s/js_//g`
done