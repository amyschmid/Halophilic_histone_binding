## ----- automatedTSSanalysis
automatedTSSanalysis<-function(perbase,genelist,species) {
  #Inputs are: perbase, the output file from bedtools genomecov, and
  #Genelist, the Proteintable downloaded from NCBI.
  #Returns a list, with $heatmpap being a matrix and $meanTSS being the avg across all TSS.
  #species=2 for +-800bp (advisable for eukaryotes like yeast), anything else for +-400bp.
  #Uses dependency getTSSdata.R which actually gets the matrix.
  
  genelist=read_excel(paste(genelist,sep=""))
  perbase=read.table(paste(perbase,sep=""))
  
  l=length(genelist$Start)
  if (as.character(species)==2) {
    allchrTSS=matrix(data=NA,nrow=l,ncol=1601)
  }
  else {
    allchrTSS=matrix(data=NA,nrow=l,ncol=801) 
  }
  
  #get chromosome names
  a=unique(perbase$V1)
  b=length(a)
  
  startcounter=1
  stopcounter=0
  
  #this will be done for each chromosome/replicon in the genome.
  for (i in (1:b)) {
    
    #separate by chromosome
    tempgenes=genelist[genelist$'Replicon Accession'==a[i],]
    tempcoverage=perbase[perbase$V1==a[i],]
    
    #trim first and last genes to avoid possibly going into coordinates that don't exist
    c=length(tempgenes$Start)
    tempgenes=tempgenes[2:(c-1),]
    
    #use getTSSdata.R code to get the matrix of values around each TSS
    if (species==2) {
    tempTSS=getTSSdata5(tempgenes,tempcoverage)
    }
    else {
      tempTSS=getTSSdata6(tempgenes,tempcoverage)    }
    
    stopcounter=stopcounter+length(tempTSS[,1])
    allchrTSS[startcounter:stopcounter,]=tempTSS
    startcounter=stopcounter+1
  }
  
  #3 steps of cleaning up the data:
  allchrTSS=na.omit(allchrTSS) #remove NAs
  #normalise to its own mean (to allow comparison with other TSS data)
  allchrTSS_selfnorm=allchrTSS/mean(allchrTSS)
  allchrTSS_selfnorm_cm=colMeans(allchrTSS_selfnorm)
  
  #remove the top 1% reads to allow better visualisation - they are all made equal to the 99th percentile read.
  bins=seq(min(allchrTSS_selfnorm),max(allchrTSS_selfnorm),by=0.5)
  s=cut(allchrTSS_selfnorm ,bins)
  TSSfreq=(transform(table(s)))$Freq
  maxsum=0.99*sum(TSSfreq)
  runningsum=0
  stop=FALSE
  for (i in (1:length(TSSfreq))) {
    runningsum=runningsum+TSSfreq[i]
    if (runningsum>maxsum) {
      neededlevel=i/2
      stop=TRUE
      break
    }
    if (stop) {break}
  }
  allchrTSS_new=replace(allchrTSS_selfnorm,allchrTSS_selfnorm>neededlevel,neededlevel)
  
  #create final list object with heatmap matrix and vector of averages
  outputvar=list('heatmap'=allchrTSS_new,'meanTSS'=allchrTSS_selfnorm_cm)
  return(outputvar)
}