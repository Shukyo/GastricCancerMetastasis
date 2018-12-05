#!/bin/bash

if [ -z `which gatk` ];then
  echo "No GATK-4.0 on this computer, please install first"
  exit 1
fi

if [ ! $1 ]||[ ! $2 ]||[ ! $3 ];then
   echo "Usage:"
   echo "     "$0 " sampleName input.vcf.gz contamination.table "
   echo
   exit 0
fi

mkdir somatics/once_filtered || exit 1


gatk FilterMutectCalls \
        -V $2 \
        --contamination-table  $3  \
        -O somatics/once_filtered/$1.somatic_oncefiltered.vcf.gz
