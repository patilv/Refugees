library(shiny)
library(rCharts)
load("reflong.Rda")
reflong$Country=as.factor(reflong$Country)
shinyServer(function(input, output) {
  output$countryPlot <- renderChart2({
    df=reflong[reflong$Country==input$country,]
    df=df[order(-df$Number),]
    np1<- nPlot(x="State",y="Number", 
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