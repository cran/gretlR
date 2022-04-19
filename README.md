A Seamless Integration of Gretl and R
================
Sagiru Mati (PhD)

# About gretlR

gretlR is an R package that can run `gretl` program from R Markdown.

# Installation

gretlR can be installed using the following commands in R.

``` r
install.packages("gretlR")

          OR
          
devtools::install_github('sagirumati/gretlR')
```

# Usage

Please load the gretlR package as follows:

    ```{r gretlR}                                                             
    library(gretlR)
    ```

Then create a chunk for `gretl` as shown below:

    ```{gretl gretlR,eval=T,echo=T,comment=NULL} 
    nulldata 500
    set seed 13
    gretl1 = normal()
    gretl2 = normal()
    setobs 12 1980:01 --time-series
    gnuplot gretl1 --time-series --with-lines --output="line.png"
    gnuplot gretl2 gretl1 --output="scatter.png"
    ols gretl1 const gretl2
    modeltab add
    tabprint --output="olsTAble.Rmd"
    tabprint --output="olsTable.tex"
    tabprint --output="olsTAble.csv"
    eqnprint --output="olsEquation.tex"
    ```  

The above chunk creates a gretl program with the chunk’s content, then
automatically run the gretl script, which will save gretl outputs in the
new folder `gretlR` created in the current working directory.

# include_graph function

We can *dynamically and reproducibly* fetch the `gretl` graph object we
created with the `gretl` chunk using the following R chunk:

For the scatter graph:

``` r
include_graph(chunk = "gretlR",graph = "scatter.png")
```

<br><br><br><br>

or the line graph:

``` r
include_graph(chunk = "gretlR",graph = "line.png")
```

# include_tex function

we can also include the equation of the OLS generated by the `gretl`
chunk and save as `olsEquation.tex`.

If the output is `pdf`, one can use the raw `LaTeX` codes as follows:

`\input{gretlr/gretlR/olsEquation.tex}`

Or use `include_tex` function to include the equation as shown below:

``` r
include_tex(chunk = "gretlR",tex = "olsEquation")
```

``` r
include_tex(chunk = "gretlR",tex = "olsTAble",start = 7,end = 24)
```

<br><br><br><br>

The OLS table output is saved by the `gretl` chunk as `olsTable.Rmd`.
The entire OLS table output can included as child document as follows:

    ```{r child, child='gretlr/gretlR/olsTable.Rmd'} 

    ```

# import_kable function

The `gretl` chunk also saves the OSL table as `olsTable.csv`. The
`import_kable` function can be used to import it as a table. further
customisation can be done with `kableExtra` package.

``` r
import_kable(chunk = "gretlR",file = "olsTAble.csv",caption="Table generated from gretl 
             chunk", start=3,end=7,digits=2) |> 
kableExtra::kable_styling(latex_options = c("basic","hold_position","scale_down")) |> 
 kableExtra::row_spec(0,bold=T)
```

# write_inp function

This function writes `gretl` file.

``` r
code=r'(nulldata 500
set seed 13
gretl1 = normal()
gretl2 = normal()
setobs 12 1980:01 --time-series
gnuplot gretl1 --time-series --with-lines --output="line.png"
gnuplot gretl2 gretl1 --output="scatter.png"
)'

write_inp(code,path="gretlCodes")
```

# exec_inp function

This function executes existing `gretl` files.

``` r
code=r'(nulldata 500
set seed 13
gretl1 = normal()
gretl2 = normal()
setobs 12 1980:01 --time-series
gnuplot gretl1 --time-series --with-lines --output="line.png"
gnuplot gretl2 gretl1 --output="scatter.png"
 )'
write_inp(code,path="SomeFolder/gretlCodes")
exec_inp("someFolder/gretlCodes")
```

# exec_gretl function

This function creates `gretl`file from R object or a set of character
strings and executes it. It is a combination of `write_inp` and
`exec_inp` functions.

``` r
code=r'(nulldata 500
set seed 13
gretl1 = normal()
gretl2 = normal()
setobs 12 1980:01 --time-series
gnuplot gretl1 --time-series --with-lines --output="line.png"
gnuplot gretl2 gretl1 --output="scatter.png"
 )'
exec_gretl(code)
```

# Demo

Demo can be accessed via `demo(package="gretlR")`.

``` r
demo(exec_inp) 
demo(write_inp)
demo(exec_gretl)
```

# R Markdown template

The R Markdown template for the `gretlR` can be accessed via
`file -> New File -> R Markdown -> From Template -> gretlR`

<br><br><br><br>

Please download a set of example files from
[Github](https://github.com/sagirumati/gretlR/tree/master/inst/examples/).
