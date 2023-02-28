#!/bin/bash

mkdir -p "${BIN_DIR}"
pushd "${BIN_DIR}" || exit 1

set -e

KUSTOMIZE_DOWNLOAD_PATH="${BIN_DIR}/${KUSTOMIZE_FILENAME}"

if [ -f "${KUSTOMIZE_DOWNLOAD_PATH}" ]; then
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

echo "${BIN_DIR}" >> $GITHUB_PATH
"${BINDIR}/kustomize" version
kustomize version
