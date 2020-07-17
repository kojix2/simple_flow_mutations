#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

tabav=table_annovar.pl
conv=convert2annovar.pl
dbd=$avd/annovar-hg38
bver=hg38

vcf=${id}.all.pass.vcf.gz
avi=${id}.all.pass.avinput
g1=tommo-3.5kjpnv2-20181105open-af_snvall.INFO.genericdb
g2=tommo-3.5kjpnv2-20181105open-af_snvall.MAF.genericdb
g3=tommo-3.5kjpnv2-20181105open-af_indelall.INFO.genericdb
g4=tommo-3.5kjpnv2-20181105open-af_indelall.MAF.genericdb

export PATH=${avd}:${PATH}
${conv} \
    --format vcf4 \
    --outfile ${avi} \
    --filter PASS \
    <(gunzip -c ${vcf})

${tabav} \
    --buildver ${bver} \
    --outfile ${id} \
    --remove \
    --protocol cytoBand,refGene,avsnp150,generic,generic,generic,generic \
    --operation r,g,f,f,f,f,f \
    --genericdbfile ${g1},${g2},${g3},${g4} \
    --argument ",--hgvs --exonicsplicing,,,,," \
    --nastring . \
    --polish \
    --otherinfo \
    ${avi} \
    ${dbd}
