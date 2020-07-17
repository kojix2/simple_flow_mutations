#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

snvi=${id}.snv.raw.vcf.gz
snvo=${id}.snv.pass.vcf.gz
indeli=${id}.indel.raw.vcf.gz
indelo=${id}.indel.pass.vcf.gz

gatk --java-options ${javaopt} \
	VariantFiltration \
	-R ${ref} \
	-V ${snvi} \
	-O ${snvo} \
	-filter "QD < 2.0" --filter-name "QD2" \
	-filter "QUAL < 30.0" --filter-name "QUAL30" \
	-filter "FS > 60.0" --filter-name "FS60" \
	-filter "MQ < 40.0" --filter-name "MQ40" \
	-filter "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" \
	-filter "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8"
#	-filter "SOR > 3.0" --filter-name "SOR3" \

gatk --java-options ${javaopt} \
	VariantFiltration  \
	-R ${ref} \
	-V ${indeli} \
	-O ${indelo} \
	-filter "QD < 2.0" --filter-name "QD2" \
	-filter "QUAL < 30.0" --filter-name "QUAL30" \
	-filter "FS > 200.0" --filter-name "FS200" \
	-filter "ReadPosRankSum < -20.0" --filter-name "ReadPosRankSum-20"
