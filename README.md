# Halophilic_histone_binding
R codes used to analyze genome-wide binding using ChIP-Seq

Codes related to the paper: biorxiv.org/ADD WHEN APPROPRIATE

The codes within the subfolders are R codes written in R 4.0.3. They are reliant on processed files generated from ChIP-Seq sequencing data. Below is a guide for converting raw (fastq) sequencing files into the useful, processed formats (Sorted BAM, wig, perbase txt files):

#Downloading from NCBI SRA

sratoolkit.2.9.0-ubuntu64/bin/fastq-dump -I  SRR* --gzip
(--split-files flag used for paired-end sequencing)


#FastQC for quality checks

fastqc -o ./fastqc_reports/ *.fastq.gz


#Trim galore (using cutadapt) for trimming out adapter sequences

trim_galore -o ./trimming *.fastq.gz

(--paired flag if using paired-end sequencing)


#Bowtie2-build to generate files with genome info

bowtie2-build downloadedgenome.fna Nameofspecies

where downloadedgenome.fna is the NCBI RefSeq genome (details in Table S2 of the paper)


#Bowtie2 to align trimmed fastq file to genome and create SAM file

bowtie2 -x Nameofspecies -U trimmed.fq.gz -S .sam

(for single-end sequencing)

bowtie2 -x Nameofspecies -1 trimmed_val_1.fq.gz -2 trimmed_val_2.fq.gz -S .sam

(for paired-end sequencing)

#Converting SAM to compressed and sorted BAM file, indexing the sorted BAM file

samtools view -bS .sam > .bam

samtools sort .bam -o _sorted.bam

samtools index _sorted.bam

The sorted.bam file can be used for peak calling with Mosaics (as detailed within the Peakcalling subfolder here). It is also used to generate other useful files


#WIG file for visualisation

samtools mpileup _sorted.bam | perl -ne 'BEGIN{print "track type=wiggle_0 name= description=fileName\n"};($c, $start, undef, $depth) = split; if ($c ne $lastC) { print "variableStep chrom=$c\n"; };$lastC=$c;next unless $. % 10 ==0;print "$start\t$depth\n" unless $depth<3;'  > .wig

This wig file is used ffor visualisation in IGV (used to generate Fig 3 of the paper)


#Perbase txt file

bedtools genomecov -ibam _sorted.bam -d > _perbase.txt

This is a file which contains the read depth at each position of each chromosome within the species. It is used to generate the TSS lineplots and heatmaps.
