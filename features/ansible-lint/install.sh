#!/usr/bin/env bash
set -e

pipx inject ansible-core ansible-lint --include-apps

echo "Installed $(ansible-lint --version)"
