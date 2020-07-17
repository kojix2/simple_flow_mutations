#!/bin/bash

id=""
javaopt="-Xmx16g"
ref=/SSD2T/data/GRCh38.primary_assembly.genome.fa
bwa_ref=/SSD2T/data/bwa/GRCh38.primary_assembly.genome.fa
ths=15
avd=/SSD2T/annovar

fq1=fastq/${id}.sra_1.fastq.gz
fq2=fastq/${id}.sra_2.fastq.gz

if [ "$id" = "" ]; then
  echo "Please set your id."
  exit 1
fi