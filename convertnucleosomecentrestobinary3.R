convertnucleosomecentrestobinary3=function(TableS4,NCBIgenome,histonesize) {
  #Made for Suppl table S4 of Maruyama et al 2013 BMC.
  #Takes the table of positions and scores, and the fna genome sequence from NCBI.
  #maps these back to the genome, by picking out histonesize around each centre
  #concatenates all these strings from each nucleosome, and converts this into a binary based on AA/TT/TA presence.
  
  library(seqinr)
  library(pracma)
  library(readxl)
  
  nucleosomecentres <- read_excel(paste(TableS4))
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
  
  for (j in (2:l)) {
    nucseq=mainchr[centrestarts[j]:centrestops[j]]
    if ((centrestarts[j]-centrestarts[j-1])>60) {
      combinednucseq=append(combinednucseq,nucseq)
    } else {
      combinednucseq=combinednucseq
    }
    
  }
  
  combinednucseq=combinednucseq[-1]
  
  
  combinednucseq=na.omit(combinednucseq)
  
  binarynucseq=convertseqtobinary_AATTTA2(combinednucseq)
  
  
  return(binarynucseq)
}