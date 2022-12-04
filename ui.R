#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("EURO Stocks"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Make Investment"),
            radioButtons("index",
                "Chose Index",
                choices = c("DAX", "SMI", "CAC", "FTSE"),
                selected = "DAX"
            ),
            sliderInput("date",
                        "Holding Period:",
                        min = 1991.5,
                        max = 1998.5,
                        value = c(1994.5, 1997.5)),
            h3("Description"),
            HTML('Chose Index and make an Investment on this Index for a time 
               period between 1991 and 1998. This little App will show you how 
               good you managed your money. The Holding period describes, when 
               you buy and when you sell. See on the right side, how much money 
               you made or lost. The App will automaticlly adjust, if you change
               anything, no action of you required.
               <br> <br>
               Unfortunately this is historic data and you 
               cannot travel back in time or can you!?')
        ),

        # Show a plot of the generated plot
        mainPanel(
            plotOutput("PlotIndex")
        )
    )
))
