#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
version=0.17.0
checksum=8533d07f9ccbd7a65824b9e0459041bca34af1eb33daba48f59215593753a3b7
tool_dir="${XDG_CACHE_HOME:-$HOME/.cache}/cv-blog/tectonic/$version"
tectonic_bin=${TECTONIC_BIN:-$tool_dir/tectonic}

if [[ -z ${TECTONIC_BIN:-} && ! -x "$tectonic_bin" ]]; then
  if [[ $(uname -s) != Linux || $(uname -m) != x86_64 ]]; then
    echo "Set TECTONIC_BIN to an installed Tectonic executable on this platform." >&2
    exit 1
  fi
  mkdir -p -- "$tool_dir"
  download_dir=$(mktemp -d "$tool_dir/download.XXXXXX")
  trap 'rm -rf -- "$download_dir"' EXIT
  curl --fail --location --silent --show-error --retry 3 \
    --connect-timeout 30 --max-time 180 \
    "https://github.com/tectonic-typesetting/tectonic/releases/download/tectonic%40$version/tectonic-$version-x86_64-unknown-linux-musl.tar.gz" \
    --output "$download_dir/tectonic.tar.gz"
  printf '%s  %s\n' "$checksum" "$download_dir/tectonic.tar.gz" | sha256sum --check --status
  tar --extract --gzip --file "$download_dir/tectonic.tar.gz" --directory "$download_dir" tectonic
  install -m 0755 "$download_dir/tectonic" "$tectonic_bin"
fi

mkdir -p -- "$repo_dir/cv/build"
cd -- "$repo_dir/cv/source"
"$tectonic_bin" --version
"$tectonic_bin" -X compile --untrusted --keep-logs --outdir "$repo_dir/cv/build" resume.tex
echo "Built $repo_dir/cv/build/resume.pdf"
