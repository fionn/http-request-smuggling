#!/bin/bash

set -euo pipefail

# shellcheck disable=SC2153
readonly lab_id="$LAB_ID"

http_data_file="$1"
if [ ! -e "$http_data_file" ]
then
    echo "$http_data_file not found" >&2
    exit 1
fi

for _ in 1 2
do
    sed -e "s/your-lab-id/$lab_id/" < "$http_data_file" | unix2dos | ncat -v --ssl "$lab_id.web-security-academy.net" 443
done
