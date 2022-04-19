## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment = NULL,eval = F)
if(!require(gretlR)) install.packages('gretlR')
if(!require(kableExtra)) install.packages('kableExtra')
options(knitr.kable.NA = '')
library(gretlR)

## ----installation,eval=FALSE--------------------------------------------------
#  install.packages("gretlR")
#  
#            OR
#  
#  devtools::install_github('sagirumati/gretlR')

## ----color,echo=T,fig.cap="Scatter graph produced by gretl chunk",out.width='\\textwidth'----
#  
#  include_graph(chunk = "gretlR",graph = "scatter.png")

## ----echo=T,out.width='\\textwidth',fig.cap="Line graph produced by gretl chunk"----
#  
#  include_graph(chunk = "gretlR",graph = "line.png")

## ----includeTex---------------------------------------------------------------
#  
#  include_tex(chunk = "gretlR",tex = "olsEquation")
#  

## ----includeTex1--------------------------------------------------------------
#  include_tex(chunk = "gretlR",tex = "olsTAble",start = 7,end = 24)
#  

## ----importKable--------------------------------------------------------------
#  import_kable(chunk = "gretlR",file = "olsTAble.csv",caption="Table generated from gretl
#               chunk", start=3,end=7,digits=2) |>
#  kableExtra::kable_styling(latex_options = c("basic","hold_position","scale_down")) |>
#   kableExtra::row_spec(0,bold=T)
#  

## ----writeInp-----------------------------------------------------------------
#  code=r'(nulldata 500
#  set seed 13
#  gretl1 = normal()
#  gretl2 = normal()
#  setobs 12 1980:01 --time-series
#  gnuplot gretl1 --time-series --with-lines --output="line.png"
#  gnuplot gretl2 gretl1 --output="scatter.png"
#  )'
#  
#  write_inp(code,path="gretlCodes")
#  

## ----execInp------------------------------------------------------------------
#  code=r'(nulldata 500
#  set seed 13
#  gretl1 = normal()
#  gretl2 = normal()
#  setobs 12 1980:01 --time-series
#  gnuplot gretl1 --time-series --with-lines --output="line.png"
#  gnuplot gretl2 gretl1 --output="scatter.png"
#   )'
#  write_inp(code,path="SomeFolder/gretlCodes")
#  exec_inp("someFolder/gretlCodes")
#  

## ----execGretl----------------------------------------------------------------
#  code=r'(nulldata 500
#  set seed 13
#  gretl1 = normal()
#  gretl2 = normal()
#  setobs 12 1980:01 --time-series
#  gnuplot gretl1 --time-series --with-lines --output="line.png"
#  gnuplot gretl2 gretl1 --output="scatter.png"
#   )'
#  exec_gretl(code)
#  

## ----demo---------------------------------------------------------------------
#  demo(exec_inp)
#  demo(write_inp)
#  demo(exec_gretl)

