#!/usr/bin/env bash
set -e

ARCH=$(uname -m)
case "$ARCH" in
  x86_64)  TOFU_ARCH="amd64" ;;
  aarch64) TOFU_ARCH="arm64" ;;
  *)       echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

curl -fsSL "https://github.com/opentofu/opentofu/releases/download/v${VERSION}/tofu_${VERSION}_linux_${TOFU_ARCH}.zip" \
  -o /tmp/tofu.zip
unzip -q /tmp/tofu.zip -d /usr/local/bin tofu
rm /tmp/tofu.zip

echo "Installed $(tofu --version)"
