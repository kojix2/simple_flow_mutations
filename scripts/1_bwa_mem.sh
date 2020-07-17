#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

rg="@RG\tID:${id}\tSM:${id}\tPL:illumina\tLB:${id}"

bwa mem \
       -R ${rg} \
       -o ${id}.sam \
       -t ${ths} \
       ${bwa_ref} \
       ${fq1} ${fq2} \
