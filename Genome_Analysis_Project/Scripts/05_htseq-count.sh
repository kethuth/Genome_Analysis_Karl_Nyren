#!/usr/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:30:00
#SBATCH -J Genome_Assembly_Karl_Nyren
#SBATCH --mail-type=ALL
#SBATCH --mail-user karl.nyren.6523@student.uu.se

module load bioinfo-tools
module load htseq/0.9.1
module load samtools/1.9

RNA_SERUM='RNA-Seq_Serum'
RNA_BH='RNA-Seq_BH'
ANNOTATION_DIR='/home/karlnyr/Genome_Analysis/gene_counts/Genome_Assembly'
ALIGNMENT_DIRS='/home/karlnyr/Genome_Analysis/gene_counts'
OUTDIR='/home/karlnyr/Genome_Analysis/gene_counts'

for FILE in $ALIGNMENT_DIRS/$RNA_SERUM/ERR*;
    do
        samtools view $FILE | htseq-count --format bam --type CDS  $FILE  > rna_bh_ERR1797972_counts.txt
done
