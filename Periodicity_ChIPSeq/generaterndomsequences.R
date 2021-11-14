generaterndomsequences=function(NCBIgenome,numberofregions,lengthofregions) {
  
  genome=read.fasta(paste(NCBIgenome))
  chromosome=genome[[1]]
  
  outerrange=length(chromosome)-lengthofregions
  peaklocs=sample(1:outerrange,numberofregions,replace=F)
  
  combinedseq=vector(length=1)  
  
  for (j in (1:numberofregions)) {
    peakstart=peaklocs[j]
    peakstop=peaklocs[j]+lengthofregions
    peakseq=chromosome[peakstart:peakstop]
    combinedseq=append(combinedseq,peakseq)
  }
  
  combinedseq=combinedseq[-1]
  combinedseq=na.omit(combinedseq)
  
  combinedseq_AATTTA=convertseqtobinary_AATTTA(combinedseq)
  random_AATTTA=spec.ar(combinedseq_AATTTA,plot=FALSE)
  
  return(random_AATTTA)
}