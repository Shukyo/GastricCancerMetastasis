# GastricCancerMetastasis
---
## Prerequisite
1. Download or link the reference files into data folder
    * hg19.fa
    * af-only-gnomad.raw.sites.b37.vcf.gz
    * af-only-exac.noTCGA.common.hg19.vcf.gz

## Usages of scripts
1. alignment
2. mutect2
  1. mutect2 main programme:
  2. caculate the contamination:
```shell
for i in A1 A2 A3 B1 B2 B3 E1 E2 E3 F1 F2 F3 H1 H2 H3 I1 I2 I3 J1 J2 J3 K1 K2 K3 N1 N2 N3 O1 O2 O3 Q1 Q2 Q3 R1 R2 R3 S1 S2 S3 T1 T2 T3 V1 V2 V3 W1 W2 W3 X1 X2 X3
do
  nohup ./contaminationCalulate.sh  bam/${i}.sorted.dedup.realign.recal.bam contamination/${i}   >contamination/log.${i} &
done
```
  3. filtering
  ```shell
   for i in somatics/*.vcf.gz
   do
    nohup ./mutect2filter.sh  `basename $i .vcf.gz`  $i  ./contamination/`basename $i .vcf.gz`.calculatecontamination.table
   done
  ```
2. caculate the

###  samples
A1 A2 A3 B1 B2 B3 E1 E2 E3 F1 F2 F3 H1 H2 H3 I1 I2 I3 J1 J2 J3 K1 K2 K3 N1 N2 N3 O1 O2 O3 Q1 Q2 Q3 R1 R2 R3 S1 S2 S3 T1 T2 T3 V1 V2 V3 W1 W2 W3 X1 X2 X3
