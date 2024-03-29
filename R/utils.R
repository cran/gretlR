#' @import knitr
#' @import kableExtra
#' @import rmarkdown
#' @importFrom utils read.csv
#' @importFrom magrittr %>%


# create_dir


create_dir=function(x) if(!dir.exists(x)) dir.create(x,recursive = T)



# system_exec

system_exec=function(){

  oldHOME=Sys.getenv("HOME")
  Sys.setenv(HOME=tempdir())

  gretlExecFile=eval(expression(gretlExecFile),envir = parent.frame()) # Dynamic scoping
  system2("gretlcli",paste("-b -e -t",gretlExecFile))
  on.exit(unlink(gretlExecFile),add = T)
  on.exit(Sys.setenv(HOME=oldHOME),add = T)

  }



# .onLoad


.onLoad<-function(libname,pkgname){
  knit_engines$set(gretl=eng_gretl)
}


kable_format <- function(){
  if(opts_knit$get("rmarkdown.pandoc.to")=="docx") format="pandoc"
  if(opts_knit$get("rmarkdown.pandoc.to")=="latex") format="latex"
  if(opts_knit$get("rmarkdown.pandoc.to")=="html") format="html"
  return(format)
}



# unlink_gretl

# unlink_gretl=function(){
# homePath=path.expand("~")
# gretl_files=dir(homePath,"\\.gretl",all.files = T) %>%
# unlink(paste0(homePath,"/",.),recursive = T)
# }



# writeLines(c("set use_cwd on",code), gretlFile)
# which(!nzchar(a))


# which(sapply(a,xfun::is_blank)) To find all blank lines in a text
# OR
# grep("^\\s*$", a)
# which(!nzchar(a))





#
# unlink_gretl=function(){
#   homePath=path.expand("~")
#
#   # gretl_files=c("gretl","sagg",".gretl",".gretl2rc") %>% .[file.exists(paste0('/home/sagirumati/',.))]
#
#   # gretl_hidden_files=dir(homePath,"^\\.gretl",all.files = T)
#
#   # if(all(file.exists(paste0(homePath,'/',gretl_hidden_files))))  unlink(paste0(homePath,'/',gretl_hidden_files),recursive = T)
#
#   gretl_hidden_files=c(".gretl",".gretl2rc")
#
#   unlink(paste0(homePath,'/',gretl_hidden_files),recursive = T)
#
#   gretl_folder=dir(homePath,"^gretl$",all.files = T)
#   if(file.exists(paste0(homePath,'/',gretl_folder))){
#     if(length(dir(paste0(homePath,'/gretl')))==0) unlink(paste0(homePath,"/gretl"),recursive=T)
#   }
#
# }
