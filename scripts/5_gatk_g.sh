#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

gvcf=${id}.g.vcf.gz
vcf=${id}.both.vcf.gz

gatk --java-options ${javaopt} \
     GenotypeGVCFs \
     -R ${ref} \
     -V ${gvcf} \
     -O ${vcf}
