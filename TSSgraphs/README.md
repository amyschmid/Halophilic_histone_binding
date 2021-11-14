# AutomatedTSS.Rmd 

It is a wrapper that generates the average occupancy across start sites (as seen in Fig 5 of the paper) as well as heatmapsshowing occupancy in each start site (Fig  S3). As a sample, it shows the avg occupancy from 3 DNA-binding proteins with available ChIP-Seq data: Hbt sal HpyA (halophilic histone), S cerevisiae H3 (eukaryotic histone), Hca his TrmB (halophilic TF)

It requires the R codes automatedTSSanalysis.R, getTSSdata5.R, and getTSSdata6.R. automatedTSSanalysis.R is itself a wrapper code to combine the output of getTSSdata (which is generated per chromosome/megaplasmid) into a single matrix for the full genome.

Input files are perbase .txt files containing read depth at each position of the genome (made as described in the readme of the parent directory). The final input is the NCBI protein table .txt file was taken and saved as a .xlsx (uploaded here for Hbt sal NRC-1, S cerevisiae S288C, Hca his ATCC33960). Further details of NCBI files used are in Table S2 of the paper.

Library dependencies:
viridis_0.5.1 ggplot2_3.3.5 pheatmap_1.0.12 fastcluster_1.2.3
