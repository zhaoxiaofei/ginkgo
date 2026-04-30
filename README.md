This repository is a fork of [robertaboukhalil/ginkgo](https://github.com/robertaboukhalil/ginkgo)

The core functionality added in this fork is support for building any user-specified genome assembly from a FASTA format file.

#### Build Custom Genome
Please first install GNU parallel (e.g., by running `conda install conda-forge::parallel`), which greatly speeds up the genome-building process by multi-processing (running multiple jobs at once).
Then, run the commands below to build your target genome:
```bash
cd "genomes/${GENOME_NAME_1}"
bash -evx ../../end2end_buildGenome.sh "${GENOME_FASTA_FILE}" "${GENOME_NAME_2}"
# Recommendation: keep ${GENOME_NAME_1} and ${GENOME_NAME_2} identical
```

#### Run Ginkgo Analysis
Once the genome build is complete, you can execute Ginkgo via `cli/ginkgo.sh`. This implementation follows exactly the same core logic as the original [robertaboukhalil/ginkgo](https://github.com/robertaboukhalil/ginkgo) repository.

