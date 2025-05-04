#!/usr/bin/env bash
set -e
bash run_all.sh --demo
test -f outputs/closure_graph.parquet
