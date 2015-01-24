library('quantmod')
#install.packages('quantmod')
#install.packages('xts')
#install.packages('zoo')
# get data
#getSymbols("AAPL")
#getSymbols("ORCL")
#getSymbols("IBM")
#'last 1 months'
#'last 3 months'
#'last 6 months'
#'last 1 year'


# pre-process 
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

