#!/usr/bin/env bash

#if [[ -f swe-pri-key ]] && [[ -f swe-pub-key ]] ; then
#  echo "Private and Public keys generated successfully."
#  exit 1
#else 
#  echo "Keys not  generated "
#  exit 1
#fi

for f in *-key
do
    if [ -f "$f" ] 
    then 
    echo "Key file $f is created"
      else
    echo "Key file $f is Not created"
    fi
    exit 1
done
exit 0
