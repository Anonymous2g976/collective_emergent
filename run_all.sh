#!/usr/bin/env bash
set -euo pipefail
LOGDIR="logs/$(date +%Y-%m-%d_%H%M%S)"
mkdir -p "$LOGDIR"
USE_DEMO=false
[[ "${1-}" == "--demo" ]] && USE_DEMO=true
if ! $USE_DEMO; then
  bin/fetch_full_data.sh |& tee "$LOGDIR/00_fetch.log"
fi
for STAGE in {1..5}; do
  python scripts/stage${STAGE}_*.py ${USE_DEMO:+--demo} \
    |& tee "$LOGDIR/${STAGE}_stage${STAGE}.log"
done
