#!/bin/bash

gatk Mutect2  \
	-R /database/ref/hg19.fa \
	-I $1 \
	-I $2 \
	-tumor `expr substr $1 8 2` \
	-normal `expr substr $2 8 2` \
	--disable-read-filter MateOnSameContigOrNoMappedMateReadFilter \
	--germline-resource ./af.chr.vcf.gz \
	--panel-of-normals ./pon/17gc.pon.vcf.gz \
	--af-of-alleles-not-in-resource  0.0000025 \
	-O `expr substr $1 8 2`.vcf.gz 

