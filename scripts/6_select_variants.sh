#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

raw=${id}.both.vcf.gz
snv=${id}.snv.raw.vcf.gz
indel=${id}.indel.raw.vcf.gz

gatk --java-options ${javaopt} \
	SelectVariants \
	-R ${ref} \
	-V ${raw} \
	--select-type-to-include SNP \
	-O ${snv}

gatk --java-options ${javaopt} \
	SelectVariants \
	-R ${ref} \
	-V ${raw} \
	--select-type-to-include INDEL \
	-O ${indel}
