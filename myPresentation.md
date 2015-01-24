My Shiny App 
========================================================
title: Stock Price- Apple, Oracle and IBM
author: Anita Lin
date: 2015Jan24


My Stock 
========================================================
I choose three stock codes:AAPL is for Apple, ORCL is ORCAL and IBM is for IBM. All data have been collected from quantmod for 1 year. 

There are three programs:sever.R, ui.R and myStock.R.

My stock address- https://coolem90.shinyapps.io/Project/

My stock funcion syntax
========================================================
Pre-Process function:Ensure what sotck code user want and what duration user want 

```r
library('quantmod')

 
getData <- function(name, criteria) {
  if(name=='AAPL'){
    getSymbols('AAPL')
    chartSeries(AAPL, subset=criteria)
    addBBands()
  }else if(name=='ORCL'){
    getSymbols('ORCL')
    chartSeries(ORCL, subset=criteria)
    addBBands()
  }else if(name=='IBM'){
    getSymbols('IBM')
    chartSeries(IBM, subset=criteria)
    addBBands()
  }
}
```


My ui syntax
========================================================
Design the layout of my sock 

```r
library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stock Price- Apple, Oracle and IBM"),
  
  # Sidebar with a slider input for the mean, sd and obs
  sidebarLayout(
    sidebarPanel(
      
      br(),
      br(),
      
      p("If you cannot operate this app, please ensure libarary- quantmod- is in your R system; otherwise, please install it. "),
      
      ##Input filed for stock code
      selectInput(inputId = "stockcode",
                  label = "Stock Code:",
                  choices = c("Apple" = "AAPL", 
                              "Oracle" = "ORCL", 
                              "IBM" = "IBM")),
      ##Slide for duration
      sliderInput("duration",
                  "Duration (1-12 months):",
                  min = 1,
                  max = 12,
                  value = 1),
      
       ##Output the duration immediately
      p('Output duration'),
      textOutput('duration'),
      br(),
      
      p("Data are from ",
        a("quantmod", 
          href = "http://www.quantmod.com"))
      
      ),
    
    # Show a plot of the stock plot
    mainPanel(
      plotOutput("stockPlot")
    )
  )
))
```

<!--html_preserve--><div class="container-fluid">
<h2 style="padding: 10px 0px;">Stock Price- Apple, Oracle and IBM</h2>
<div class="row-fluid">
<div class="span4">
<form class="well">
<br/>
<br/>
<p>If you cannot operate this app, please ensure libarary- quantmod- is in your R system; otherwise, please install it. </p>
<label class="control-label" for="stockcode">Stock Code:</label>
<select id="stockcode"><option value="AAPL" selected>Apple</option>
<option value="ORCL">Oracle</option>
<option value="IBM">IBM</option></select>
<script type="application/json" data-for="stockcode" data-nonempty="">{}</script>
<div>
<label class="control-label" for="duration">Duration (1-12 months):</label>
<input id="duration" type="slider" name="duration" value="1" class="jslider" data-from="1" data-to="12" data-step="1" data-skin="plastic" data-round="FALSE" data-locale="us" data-format="#,##0.#####" data-scale="|;|;|;|;|;|;|;|;|;|;|;|" data-smooth="FALSE"/>
</div>
<p>Output duration</p>
<div id="duration" class="shiny-text-output"></div>
<br/>
<p>
Data are from 
<a href="http://www.quantmod.com">quantmod</a>
</p>
</form>
</div>
<div class="span8">
<div id="stockPlot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
</div>
</div><!--/html_preserve-->


My serve syntax
========================================================
Call my stock program before runing the shinyServer. Excute the shineyServer and update the value of duration

```r
library(shiny)
library('quantmod')

source('./myStock.R')

shinyServer(
  
  function(input, output) {
        
    output$stockPlot <- renderPlot({
      
      # Extract input values
      stockcode <- input$stockcode
      duration  <- input$duration
      # combind the charaters and numbers. change number to the specific text
      durationc  <- paste0("last ",duration," months")
      merge  <- input$merge
      output$stockcode <- renderPrint(stockcode)
      output$duration <- renderPrint(durationc)
      output$merge <- renderPrint(merge)
      getData(stockcode,durationc)
    })
  })
```


Slide With APPLe lasting for 3 months
========================================================


```
[1] "AAPL"
```

![plot of chunk unnamed-chunk-4](myPresentation-figure/unnamed-chunk-4-1.png) ![plot of chunk unnamed-chunk-4](myPresentation-figure/unnamed-chunk-4-2.png) 
