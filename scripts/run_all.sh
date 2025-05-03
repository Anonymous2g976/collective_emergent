#!/usr/bin/env bash
set -e
# Reproduce the full Systems-and-Transients pipeline for 7 Oct 2023

python scripts/ingest_day.py 2023-10-07
python scripts/build_closure.py data/raw/2023-10-07

python scripts/extract_timelines.py \
       data/raw/2023-10-07 gkg.parquet gdelt.parquet \
       closure_graph.gpickle timelines.csv

python scripts/pull_wikipedia_revisions.py \
       timelines.csv data/raw/2023-10-07/wikipedia_revisions.parquet

python scripts/rebuild_closure.py data/raw/2023-10-07

python scripts/validate_lag.py \
       data/raw/2023-10-07/timelines.csv \
       data/raw/2023-10-07/wikipedia_revisions.parquet \
       docs/step5_validation.csv

python scripts/build_inference_report.py data/raw/2023-10-07 docs

tectonic docs/executive_summary.md --outdir docs --print
mv docs/executive_summary.pdf docs/systems_transients_report.pdf
