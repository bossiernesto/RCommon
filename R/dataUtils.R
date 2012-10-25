

# pad with zeros 
padz <- function(x, n=max(nchar(x))) gsub(" ", "0", formatC(x, width=n)) 

cleanNA <- function(data){
  # clean up NA
  cc = complete.cases(data)
  data = data[cc,]
  return(data)
}



