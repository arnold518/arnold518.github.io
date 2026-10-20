#!/usr/bin/env bash
set -euo pipefail

if (( EUID == 0 )); then
  echo "Run this installer as the site owner, without sudo." >&2
  exit 1
fi

script_file=$(readlink -f -- "${BASH_SOURCE[0]}")
script_dir=$(dirname -- "$script_file")
unit_dir=${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user
user_id=$(id -u)
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$user_id}
export DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS:-unix:path=$XDG_RUNTIME_DIR/bus}

install -d -m 0755 "$unit_dir"
install -m 0644 "$script_dir/cv-blog.service" "$unit_dir/cv-blog.service"
systemctl --user daemon-reload
systemctl --user enable cv-blog.service
systemctl --user restart cv-blog.service

echo "CV blog service enabled on port 1111."
echo "Status: systemctl --user status cv-blog.service"
