#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

# Download installation files
export VENDIR_GITHUB_API_TOKEN="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"

ytt -f setup/vendir.yml \
  --data-values-file config.yaml \
  | vendir sync --chdir setup -f-

# Make binaries executable and put them in the PATH
mkdir -p bin
cp setup/vendir/binaries/kp/kp* bin/kp
cp setup/vendir/binaries/yq/yq* bin/yq

chmod +x bin/*