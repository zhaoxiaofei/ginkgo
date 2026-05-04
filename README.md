This repository is a fork of [robertaboukhalil/ginkgo](https://github.com/robertaboukhalil/ginkgo)

The core functionalities added in this fork are:
(1) Support for building any user-specified genome assembly from a FASTA format file in `end2end_buildGenome.sh`.
(2) Support for multi-processing (with mclapply) in `ginkgo_parallel.sh` and `process_parallel.sh`.

### Install with conda in one command
```bash
${conda} create -y -n ${ginkgo_envname} bioconductor-ctc bioconductor-dnacopy r-devtools r-inline r-gplots r-scales r-plyr r-ggplot2 r-gridExtra r-fastcluster r-heatmap3 \
bwa bowtie parallel wgsim 
# bioconda:bwa, bioconda:bowtie, conda-forge:parallel, and bioconda:wgsim are for building genome.
# The GNU parallel greatly speeds up the genome-building process by multi-processing (running multiple jobs at once).
```

#### Build custom genome
Then, run the commands below to build your target genome:
```bash
${conda} activate ${ginkgo_envname}
cd "genomes/${GENOME_NAME_1}/original/"
bash -evx ../../../end2end_buildGenome.sh "${GENOME_FASTA_FILE}" "${GENOME_NAME_2}"
# Recommendation: keep ${GENOME_NAME_1} and ${GENOME_NAME_2} identical
```

#### Run Ginkgo to Call CNVs from scWGS data
Once the genome build is complete, you can execute Ginkgo via `cli/ginkgo.sh` or `cli/ginkgo_parallel.sh`. This implementation follows exactly the same core logic as the original [robertaboukhalil/ginkgo](https://github.com/robertaboukhalil/ginkgo) repository.

