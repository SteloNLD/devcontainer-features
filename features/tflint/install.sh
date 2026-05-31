#!/usr/bin/env bash
set -e

ARCH=$(uname -m)
case "$ARCH" in
  x86_64)  TFLINT_ARCH="amd64" ;;
  aarch64) TFLINT_ARCH="arm64" ;;
  *)       echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

curl -fsSL "https://github.com/terraform-linters/tflint/releases/download/v${VERSION}/tflint_linux_${TFLINT_ARCH}.zip" \
  -o /tmp/tflint.zip
unzip -q /tmp/tflint.zip -d /usr/local/bin tflint
rm /tmp/tflint.zip

echo "Installed $(tflint --version)"
