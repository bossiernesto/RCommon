# Package installed 
pack.installed <- function(mypkg) is.element(mypkg, installed.packages()[,1]) 

## If you want to source() a bunch of files, something like
## the following may be useful:
pack.sourceDir <- function(path, trace = TRUE, ...) {
  for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
    if(trace) cat(nm,":")           
    source(file.path(path, nm), ...)
    if(trace) cat("\n")
  }
}

#Check if function exists in package
pack.functiinPackage<-function(pack,f){
  tryCatch(fs=ls(package:pack),error= function(e) return(FALSE))
  return(f %in% pack)
}

pack.replaceFunction <- function(name,value,pkgName){
  env=getNamespace(pkgName)
  unlockBinding(name, env)
  assignInNamespace(name, value, ns=pkgName, envir=env)
  assign(name, value, envir=env)
  lockBinding(name, env)
  rm(value) ## get rid of global copy
}

