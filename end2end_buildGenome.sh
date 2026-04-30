#!/bin/bash

# Master script: set the three site-specific variables below, then run.
# Everything else is handled by buildGenome exactly as the original authors wrote it.

####################################################
# EDIT THESE THREE LINES

# prefix for your genome (no spaces)
ASSEMBLY=$2 # e.g., GRCh38_gencode_v22_CTAT_lib_Mar012021

# GENOME_FASTA can also be an absolute path, such as /stor/zxf/cnv/cnvguider-sc-rna/db/GRCh38_gencode_v44_CTAT_lib_Oct292023.plug-n-play/ctat_genome_lib_build_dir/ref_genome.fa
GENOME_FASTA="$1" # e.g., the one from https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/GRCh38_gencode_v22_CTAT_lib_Mar012021.plug-n-play.tar.gz 

# multi-chromosome reference FASTA
SCRIPTS=$(dirname $(which $0))/genomes/scripts   # path to this scripts directory

####################################################

# Split the reference FASTA into per-chromosome files (chr1.fa, chr2.fa, ...)
# if they don't already exist.
if ! ls chr*.fa 1>/dev/null 2>&1; then
	awk '/^>/{if(f) close(f); f=substr($1,2)".fa"; print > f; next} {print >> f}' $GENOME_FASTA
fi

export SCRIPTS
export nproc=40
export GINKGO_PARENT_DIR=$(dirname $(which $0))

bash -evx $SCRIPTS/buildGenome $ASSEMBLY
