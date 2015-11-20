load("reflong.Rda")
library(shiny)

library(rCharts)
reflong$Country=as.factor(reflong$Country)
shinyUI(fluidPage(
  fluidRow(column(3,selectInput("country", "Country:",levels(reflong$Country)))),
  fluidRow(column(6,
    #plotlyOutput("statePlot",width="100%",height="800px")
    showOutput("countryPlot","nvd3")
    )
)))