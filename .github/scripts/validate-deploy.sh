#!/usr/bin/env bash

REGION=$(cat terraform.tfvars | grep -E "^region" | sed "s/region=//g" | sed 's/"//g')

aws configure set region ${REGION}
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}


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

if [ "$impfile" = "$keyname" ]
then
   echo "Public key $keyname imported into AWS Cloud successfully"
else
   echo "Public key $keyname not imported into AWS Cloud "
   exit 1
fi
   exit 0

