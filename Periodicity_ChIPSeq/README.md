# autoFT3_new.Rmd

Compares the periodicity of AA/TT/TA dinucleotides genome-wide vs the periodicity within regions bound by ChIP-Seq peaks. It requires a fasta file containing (in a single line) all sequences bound by all peaks genome-wide. This is generated in 3 steps: the peak list is saved as a .bed tab-delimited file containing chromosome name, peak start and peak stop locations for each peak, this is converted into a Fasta file using the Bedtools getfasta command (with the downloaded genome .fna file from NCBI as the other input), and finally the fasta file is concatenated into 1 line using grep -v “^>” allpeaks.fasta | awk ‘BEGIN { ORS="“; print”>Sequence_name" } { print }’ > peaks_1line.fasta

Input dependencies: genome-wide .fna file, 1-line fasta file containing sequence of all peaks, R code convertseqtobinary_AATTTA.R (all these are uploaded here)

Library dependencies: pracma_2.3.3 seqinr_4.2-8
