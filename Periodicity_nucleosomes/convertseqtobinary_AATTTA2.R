convertseqtobinary_AATTTA2 <- function(combinedsequence) {
  
  a=length(combinedsequence)
  binsequence=matrix(0,nrow=1,ncol=a)
  
  for (i in (1:(a-1))) {
    if (combinedsequence[i]=="a"&&combinedsequence[i+1]=="a"||combinedsequence[i]=="t"&&combinedsequence[i+1]=="t"||combinedsequence[i]=="t"&&combinedsequence[i+1]=="a") {
      binsequence[i]=1
    }
  }
  binsequence=as.ts(binsequence[1,])
  return(binsequence)
}