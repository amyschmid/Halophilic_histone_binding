Annotatepeaksandclassify.Rmd:

This is a modified version of code written by Rylee Hackley and Amy Schmid.

Takes a peak list; annotates each peak with the nearest feature (promoter or gene), and thus classifies each peak as belonging to coding or promoter regions. Further details are included within the code itself.

Input dependencies:

HstA_curatedlist.bed (a peak list for Hfx volcanii HstA in .bed format)

20181113_hvol_GCF_000025685.1_ASM2568v1_genomic.gff (GFF file from NCBI containing gene information for Hfx volcanii)

20181113_hvol_GCF_000025685.1_ASM2568v1_genomic.gff.key (modification of the GFF file containing important information)


Library dependencies:
rapportools_1.0 
tidyverse_1.3.1 
forcats_0.5.1 
GenomicRanges_1.42.0 
GenomicFeatures_1.42.3 
openxlsx_4.2.4 
IRanges_2.24.1 
rtracklayer_1.50.0 
AnnotationHub_2.22.1 
dplyr_1.0.7 

Peaklocationplots.Rmd

Simple code that generates bar plots from information about whether peaks are coding or intergenic.

That information is generated from the code above (Annotatepeaksandclassify.Rmd) for multiple proteins (including HstA, HpyA, other halophilic TFs). The output is stored in Peaklocations.xlsx (which is the only Input dependency)

Library dependencies:

forcats_0.5.1 ggplot2_3.3.5 readxl_1.3.1
