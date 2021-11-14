convertnucleosomecentrestobinary2=function(TableS2,NCBIgenome,histonesize) {
  #Made for Suppl table "Archaeal_browser_track_2N.bed" of Ammar et al 2012 eLife.
  #The table is available at http://chemogenomics.med.utoronto.ca/supplemental/chromatin/datafiles.php (linked within the paper)
  #I archived that page at shorturl.at/civUZ
  #Takes the table of positions and scores, and the fna genome sequence from NCBI.
  #maps these back to the genome, by picking out histonesize around each centre
  #concatenates all these strings from each nucleosome, and converts this into a binary based on AA/TT/TA presence.
  #Since nucleosomes are only in main chromosome, others excluded from here.
  
  library(seqinr)
  library(pracma)
  library(readxl)
  
  nucleosomecentres <- read_excel(paste(TableS2))
  l=length(nucleosomecentres$Peakcentre)
  
  centres=nucleosomecentres$Peakcentre
  centrestarts=centres-(histonesize/2)+1
  centrestops=centres+(histonesize/2)
  
  for (i in (1:l)) {
    centrestarts[i]=max(1,centrestarts[i])
  }
  
  genome=read.fasta(paste(NCBIgenome))
  mainchr=genome[[1]]

  combinednucseq=vector(length=1)
  
  for (j in (1:l)) {
  nucseq=mainchr[centrestarts[j]:centrestops[j]]
  
  combinednucseq=append(combinednucseq,nucseq)
    
  
  }
  
  combinednucseq=combinednucseq[-1]
   
  
  combinednucseq=na.omit(combinednucseq)
  
  binarynucseq=convertseqtobinary_AATTTA2(combinednucseq)
  
  
  return(binarynucseq)
}