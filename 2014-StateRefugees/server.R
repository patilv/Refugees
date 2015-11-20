library(shiny)
library(rCharts)
load("reflong.Rda")
reflong$State=as.factor(reflong$State)
shinyServer(function(input, output) {
  output$statePlot <- renderChart2({
    df=reflong[reflong$State==input$state,]
    df=df[order(-df$Number),]
    np1<- nPlot(x="Country",y="Number", 
                data = df, 
                type = "multiBarHorizontalChart") 
    np1$set(width=800, height=800)
    np1$chart(margin = list(left=300),showControls=FALSE,showLegend=FALSE) 
    np1$chart(tooltipContent = "#! function(key, x, y){ 
           return x + ':' + y 
  } !#")
    np1$yAxis(tickFormat = "#! function(d) {return d3.format(',.0f')(d)} !#")
    return(np1)
    })
})