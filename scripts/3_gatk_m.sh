#!/bin/bash

set -euo pipefail
ROOT="$(cd $(dirname $0); pwd)"
. "$ROOT/0_id.sh"

gatk MarkDuplicates -I ${id}.sort.bam -M ${id}.dedup.metrics.txt -O ${id}.sort.dedup.bam
