#!/bin/bash

mkdir -p /tmp/bin
pushd /tmp/bin || exit 1

set -e

if [ -f "${KUSTOMIZE_FILENAME}" ]; then
    echo "Kustomize already downloaded"
else
    curl -o "${KUSTOMIZE_FILENAME}" -L "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${VERSION}/${KUSTOMIZE_FILENAME}"
fi
cat "${KUSTOMIZE_FILENAME}"
sha256sum "${KUSTOMIZE_FILENAME}"
echo "${SHA256_CHECKSUM}  ${KUSTOMIZE_FILENAME}" > kustomize.SHA256
sha256sum -c kustomize.SHA256
tar xzf "${KUSTOMIZE_FILENAME}"
chmod u+x kustomize
popd

echo "/tmp/bin" >> $GITHUB_PATH
/tmp/bin/kustomize version
kustomize version
