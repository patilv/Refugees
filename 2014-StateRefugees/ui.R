load("reflong.Rda")
library(shiny)
library(rCharts)
reflong$State=as.factor(reflong$State)
shinyUI(fluidPage(
  fluidRow(column(3,selectInput("state", "State:",levels(reflong$State)))),
  fluidRow(column(6,
    #plotlyOutput("statePlot",width="100%",height="800px")
    showOutput("statePlot","nvd3")
    )
)))