convertnucleosomecentrestobinary=function(TableS2,NCBIgenome,histonesize) {
  #Made for Suppl table S2 of Widom 2012 Nature.
  #Takes the table of positions and scores, and the fna genome sequence from NCBI.
  #picks out top 25% of nucleosomes (based on signal/noise ratio)
  #maps these back to the genome, by picking out histonesize around each centre
  #concatenates all these strings from each nucleosome, and converts this into a binary based on AA/TT/TA presence.
  
  library(seqinr)
  library(pracma)
  library(readxl)
  
  nucleosomecentres <- read_excel(paste(TableS2))
  
  chrnames=unique(nucleosomecentres$Replicon)
  nchr=length(chrnames)
  
  genome=read.fasta(paste(NCBIgenome))
  
  #Removing chromosome 12 from yeast because it contains an anomalous region of v high coverage in input and IP (rRNA)
  #nucleosomecentres=nucleosomecentres[nucleosomecentres$Replicon!="NC_001144.5",]
  #genome[[12]]=NULL
  genomewidenucseq=vector(length=1)
  
  for (i in (1:nchr)) {
    
    chr=genome[[i]]
    currentchr=chrnames[i]
    nucleosomesinchr=nucleosomecentres[nucleosomecentres$Replicon==currentchr,]
    
    cutoff=quantile(nucleosomesinchr$Signoise,0.75)
    strongnucleosomes=nucleosomesinchr[nucleosomesinchr$Signoise>cutoff,]
    
    strongcentres=strongnucleosomes$Centre
    l=length(strongcentres)
    centrestarts=strongcentres-(histonesize/2)+1
    
    centrestops=strongcentres+(histonesize/2)
   
    combinednucseq=vector(length=1)
    
    for (k in (1:l)) {
      centrestarts[k]=max(1,centrestarts[k])
    }
    
    for (j in (1:l)) {
      nucseq=chr[centrestarts[j]:centrestops[j]]
      combinednucseq=append(combinednucseq,nucseq)
    }
    combinednucseq=combinednucseq[-1]
    genomewidenucseq=append(genomewidenucseq,combinednucseq)
  }
  genomewidenucseq=genomewidenucseq[-1]
  
  genomewidenucseq=na.omit(genomewidenucseq)
  
  binarynucseq=convertseqtobinary_AATTTA2(genomewidenucseq)
  
  
  return(binarynucseq)
}