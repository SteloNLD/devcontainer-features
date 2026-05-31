#!/usr/bin/env bash
set -e

pipx inject ansible-core ansible-lint

echo "Installed $(ansible-lint --version)"
