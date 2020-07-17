#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

samtools index -@ ${ths} ${id}.sort.dedup.bam

gatk --java-options -Xmx8g HaplotypeCaller \
       	-R ${ref} \
       	-I ${id}.sort.dedup.bam \
       	-O ${id}.g.vcf.gz \
       	--ERC GVCF --sample-name ${id}

