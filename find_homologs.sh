#!/bin/bash
query="$1"
subject="$2"
output="$3"
 
tblastn -query "$query" -subject "$subject" \
    -outfmt "6 qseqid sseqid pident length qlen" |
awk '{qcov = ($4 / $5) * 100} $3 > 30 && qcov > 90' > "$output"
 
wc -l < "$output"
