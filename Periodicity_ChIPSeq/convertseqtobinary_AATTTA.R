convertseqtobinary_AATTTA <- function(sequence) {
  a=length(sequence)
  binsequence=matrix(0,nrow=1,ncol=a)
  for (i in (1:(a-1))) {
    if (sequence[i]=="a"&&sequence[i+1]=="a"||sequence[i]=="t"&&sequence[i+1]=="t"||sequence[i]=="t"&&sequence[i+1]=="a") {
      binsequence[i]=1
    }
  }
  binsequence=as.ts(binsequence[1,])
  return(binsequence)
}