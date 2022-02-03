#!/usr/bin/env bash

keyname="swe-prd"
crefile=`ls -l *-key | wc -l`
deffile=2

if [ $deffile -eq $crefile ] 
then
    echo "Key files are created successfully"
else
    echo "Key file not created successfully"
    exit 1
fi

impfile=$(aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName]' --key-name $keyname --output=text)

if [ $impfile = $keyname ]; then
   echo "Public ket $keyname imported into AWS Cloud successfully"
else
   echo "Public key $keyname not imported into AWS Cloud "
   exit 1
fi
   exit 0

