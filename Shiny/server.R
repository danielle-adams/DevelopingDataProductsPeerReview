library(shiny)
library(dplyr)
library(datasets)
library(ggplot2)
library(maps)
library(mapproj)
source("drawMap.R")

State <- rownames(USArrests)
crimeData <- cbind(USArrests, State)

sortData <- function(crimeName, top = 20){
        index <- which(colnames(crimeData) == crimeName)
        plotData <- head(arrange(crimeData, desc(as.factor(crimeData[,index]))), top)
        plotData <- transform(plotData, State = factor(State, levels = unique(State)))
        ratePlot <- qplot(x = State, y = plotData[,index],data = plotData, geom = c("bar"),stat = "identity") + 
                theme(axis.text.x = element_text(angle = 45,hjust = 1)) + 
                ggtitle(paste("Crime Rate in each State  ", crimeName)) + 
                ylab(paste(crimeName," Rate"))
        return(ratePlot)
}

shinyServer(function(input, output){
                        
        output$crimeRatePlot <- renderPlot({
                outPlot <- sortData(input$variable, input$slide)
                outPlot
        })
        
        output$crimeMap <- renderPlot({
                stateMap(crimeData, input$variable, "darkgreen")
        }) 
})