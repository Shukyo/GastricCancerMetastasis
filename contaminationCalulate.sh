#!/bin/bash

if [ -z `which gatk` ];then
  echo "No GATK-4.0 on this computer, please install first"
  exit 1
fi

if [ ! $1 ]||[ ! $2 ];then
   echo "Usage:"
   echo $0 "inputfile output-Prefix"
fi

gatk GetPileupSummaries \
              -I $1 \
              -L data/interval.list \
              -V /database/GATK/hg19/af-only-exac.noTCGA.common.hg19.vcf.gz  \
              -O $2.getpileupsummaries.table
