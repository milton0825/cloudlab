#!/bin/bash

set -euo pipefail

which -s fswatch || (
  which -s brew || error "This script requires Homebrew to be installed."
  echo "Installing fswatch..."
  brew install fswatch || error "This script requires fswatch to be installed."
)

function _sync() {
  args=(
    -rzpv
    --delete
    --exclude='.git'
    --exclude='venv'
    --exclude='.idea'
    --exclude='.env'
    --exclude='.DS_Store'
    --exclude='*.so'
  )

  rsync "${args[@]}" "$REPO_PATH" "${REMOTE_USER}"@"${REMOTE_HOST}":"${REMOTE_BASE_PATH}"
}

function watch_files_and_sync() {
  _sync
  fswatch -r --exclude '/.git' --batch-marker=EOF "$REPO_PATH" | while read file event; do
    if [ "$file" = "EOF" ]; then
      for changed_file in "${file_list[@]}"; do
          _sync
      done
      file_list=()
    else
      echo "files changed $file"
      file_list+=("$file")
    fi
  done
}
