#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(DBI)

source("R/login_module.R")
source("R/data_module.R")
# Define UI for application that draws a histogram
ui <- fluidPage(
  tabsetPanel(
    tabPanel("Login", loginUI("moddb")),
    tabPanel("Cars", dataUI("cars", "CARS")),
    tabPanel("Iris", dataUI("iris", "IRIS"))
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  datadb <- loginServer("moddb")
  
  dataServer("cars", datadb, "modcars")
  dataServer("iris", datadb, "modiris")
}

# Run the application 
shinyApp(ui = ui, server = server)
