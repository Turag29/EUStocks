#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic 
shinyServer(function(input, output) {
    
    data <- data.frame(datasets::EuStockMarkets) %>% 
        mutate(time=rep(time(EuStockMarkets),1))


    output$PlotIndex <- renderPlot({

        # generate values based on input$bins from ui.R
        x <- data$time
        y <- data[,input$index]
        xlimit <- input$date
        index <- input$index
        



        # draw the histogram with the specified number of bins
        plot(x, 
             y,
             xlab = "time",
             ylab = "Price",
             main = "Stockprices of Index over time",
             xlim = xlimit,
             type="l")

    })

})
