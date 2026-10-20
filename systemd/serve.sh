#!/usr/bin/env bash
set -euo pipefail

script_file=$(readlink -f -- "${BASH_SOURCE[0]}")
repo_dir=$(cd -- "$(dirname -- "$script_file")/.." && pwd)
user_id=$(id -u)
group_id=$(id -g)
port=${CV_BLOG_PORT:-1111}
baseurl=${CV_BLOG_BASEURL:-/absproxy/$port}
cache_dir=${CV_BLOG_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/cv-blog}
runtime_dir=${CV_BLOG_RUNTIME_DIR:-${XDG_RUNTIME_DIR:-/run/user/$user_id}/cv-blog}
image=${CV_BLOG_IMAGE:-ruby:3.3-bookworm}

mkdir -p -- "$cache_dir/gems" "$runtime_dir"

# The source stays read-only; the generated preview lives in systemd's runtime directory.
# Dependencies are cached outside /tmp and reused when the service restarts.
exec /usr/bin/docker run --rm --init \
  --name "cv-blog-preview-$user_id" \
  --user "$user_id:$group_id" \
  --publish "127.0.0.1:$port:$port" \
  --mount "type=bind,src=$repo_dir,dst=/srv/jekyll,readonly" \
  --mount "type=bind,src=$cache_dir/gems,dst=/usr/local/bundle" \
  --mount "type=bind,src=$runtime_dir,dst=/runtime" \
  --mount type=bind,src=/usr/bin/node,dst=/usr/local/bin/node,readonly \
  --workdir /srv/jekyll \
  --env GEM_HOME=/usr/local/bundle \
  --env BUNDLE_USER_HOME=/tmp/bundler \
  --env BUNDLE_FROZEN=true \
  --env XDG_CACHE_HOME=/tmp/cache \
  --env JEKYLL_ENV=development \
  --env CV_BLOG_PORT="$port" \
  --env CV_BLOG_BASEURL="$baseurl" \
  "$image" /bin/bash -lc '
    if ! bundle check; then
      bundle install --jobs 4 --retry 3
    fi
    exec bundle exec jekyll serve \
      --host 0.0.0.0 \
      --port "$CV_BLOG_PORT" \
      --baseurl "$CV_BLOG_BASEURL" \
      --destination /runtime/site \
      --disable-disk-cache \
      --force_polling \
      --watch \
      --trace
  '
