#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

samtools view -@ ${ths} -bS ${id}.sam > ${id}.bam
rm ${id}.sam
samtools sort -@ ${ths} ${id}.bam > ${id}.sort.bam
samtools index -@ ${ths} ${id}.sort.bam
