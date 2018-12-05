#!/bin/bash

if [ -z `which gatk` ];then
  echo "No GATK-4.0 on this computer, please install first"
  exit 1
fi

if [ ! $1 ]||[ ! $2 ];then
   echo "Usage:"
   echo "     "$0 "input.bam output-Prefix"
   echo
   exit 0
fi

mkdir contamination || exit 1

gatk GetPileupSummaries \
              -I $1 \
              -L data/interval.list \
              -V data/af-only-exac.noTCGA.common.hg19.vcf.gz  \
              -O $2.getpileupsummaries.table

gatk CalculateContamination \
             -I $2.getpileupsummaries.table \
             -O $2.calculatecontamination.table
