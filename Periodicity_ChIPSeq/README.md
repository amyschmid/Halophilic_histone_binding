# autoFT3_new.Rmd

Compares the periodicity of AA/TT/TA dinucleotides genome-wide vs the periodicity within regions bound by ChIP-Seq peaks. It requires a fasta file containing (in a single line) all sequences bound by all peaks genome-wide. This is generated in 3 steps: the peak list is saved as a .bed tab-delimited file containing chromosome name, peak start and peak stop locations for each peak, this is converted into a Fasta file using the Bedtools getfasta command (with the downloaded genome .fna file from NCBI as the other input), and finally the fasta file is concatenated into 1 line using grep -v “^>” allpeaks.fasta | awk ‘BEGIN { ORS="“; print”>Sequence_name" } { print }’ > peaks_1line.fasta

Input dependencies: genome-wide .fna file, 1-line fasta file containing sequence of all peaks, R code convertseqtobinary_AATTTA.R (all these are uploaded here)

Library dependencies: pracma_2.3.3 seqinr_4.2-8

# FT_random_sequences2.Rmd

Compares the autoregression spectrum generated above (for regions bound  by ChIP-Seq peaks) with the spectrum for random regions. This is done by randomly picking n regions of w width from anywhere in the main chromosome (where n = number of ChIP-Seq peaks and w = avg width of each peak). Hence, a randomly generated psuedo peak-list has been made. The periodicity of dinucleotides within this fake peak list is obtained as above. 100 such fake peak lists are made, and their periodicity is compared with the known periodicity of the actual peak list (obtained above).

Input dependencies: generaterndomsequences.R, convertseqtobinary_AATTTA.R, genome .fna file, informataion regarding no of peaks and avg width (inputted within the file)

Library dependencies: pracma_2.3.3 seqinr_4.2-8
