#!/usr/bin/env bash
set -euo pipefail
ZENODO="https://zenodo.org/record/15334641/files"
FILES=(events_20231007.parquet wiki_20231007.parquet mastodon_20231007.parquet)
mkdir -p data/raw
for f in "${FILES[@]}"; do
  curl -L "$ZENODO/$f" -o "data/raw/$f"
done
