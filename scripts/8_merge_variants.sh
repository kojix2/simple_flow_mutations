#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

pcd=picard

vcfs=${id}.snv.pass.vcf.gz
vcfi=${id}.indel.pass.vcf.gz
vcfo=${id}.all.pass.vcf.gz

${pcd} MergeVcfs \
       INPUT=${vcfs} \
       INPUT=${vcfi} \
       OUTPUT=${vcfo}
