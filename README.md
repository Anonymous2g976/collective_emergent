# Collective Emergent

This repository contains the complete, reproducible seven-stage pipeline used
in *Systems and Transients: Mapping Cross-Tier Information Flow on 7 October 2023*.

Running

    bash scripts/run_all.sh

from the project root regenerates every intermediate object (cleaned Parquet
tables, closure graph, timelines, lag matrix) and the final typeset report at
`docs/systems_transients_report.pdf`.

Directory guide:

| path                                   | contents                                                         |
|----------------------------------------|------------------------------------------------------------------|
| `data/raw/2023-10-07/`                 | cleaned data and analytic artefacts (tracked with Git-LFS)       |
| `scripts/`                             | executable Python code for each analytic stage                   |
| `docs/`                                | narrative outline, validation tables, inference report, PDF      |
| `requirements.txt`                     | exact Python package versions (Python 3.9)                       |
| `REPLICATION.md`                       | step-by-step instructions to rebuild every artefact              |

A frozen tag (v1.0) and an archived Zenodo snapshot guarantee permanence and
cite-ability.
