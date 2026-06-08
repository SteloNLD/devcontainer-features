#!/usr/bin/env bash
set -e

pipx install ansible-navigator

cat <<'EOF' >> /etc/bash.bashrc

# Scope TMPDIR to ansible-navigator so its private_data_dir lands inside the
# host-mirrored bind mount — Docker-outside-of-Docker can't resolve paths
# under the default /tmp, which breaks the awx_display callback plugin.
ansible-navigator() {
  local tmpdir="${PWD}/.ansible-navigator-tmp"
  mkdir -p "$tmpdir"
  TMPDIR="$tmpdir" command ansible-navigator "$@"
}
EOF

echo "Installed $(ansible-navigator --version)"
