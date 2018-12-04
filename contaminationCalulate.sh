#!/bin/bash

if [ -z `which gatk` ];then
  echo "No GATK-4.0 on this computer, please install first"
  exit 1
fi

if [ ! $1 ]||[ ! $2 ];then
   echo "Usage:"
   echo "     "$0 "inputfile output-Prefix"
   echo
   exit 0
fi

gatk GetPileupSummaries \
              -I $1 \
              -L data/interval.list \
              -V data/af-only-exac.noTCGA.common.hg19.vcf.gz  \
              -O $2.getpileupsummaries.table

gatk CalculateContamination \
             -I $2.getpileupsummaries.table
             -O $2.calculatecontamination.table
