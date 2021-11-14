# AutoFT2_combined 

Generates a fourier-transform showing the periodicity of selected dinucleotides (AA/TT/TA) genome-wide. As a sample, Methnothermus fervidus (histone-based chromatin), Sulfolobus solfataricus (no histone gene), and Halobacterium salinarum (species under investigation: halophilic archaea, contains histone, but chromatin is uncertain) genomes are used. These are all .fna files downloaded from NCBI (details in Table S2). The code reads the genome (specifically, the main chromosome whose name is inputted to the code), creates a vector equal to the length of the chromosome, with 1 representing each location where a AA/TT/TA dinucleotide is found, and 0 for all other locations, and takes the autoregression spectrum of the binary resultant vector. This method is inspired by Bailey et al 2000 J Mol Biol https://doi.org/10.1006/jmbi.2000.4128

Input dependencies are the R code convertseqtobinary_AATTTA and the genome .fna files.

Library dependencies: pracma_2.3.3 seqinr_4.2-8
