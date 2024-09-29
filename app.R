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
source("R/ppr_module.R")
source("R/daft_module.R")
# Define UI for application that draws a histogram
ui <- fluidPage(
  tabsetPanel(
    tabPanel("Login", loginUI("house")),
    tabPanel("Daft", daftUI("daft")),
    tabPanel("PPR", pprUI("ppr"))
  ),
  fluidRow(
    verbatimTextOutput("conn")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  housedb <- loginServer("house")
  
  pprServer("ppr", housedb)
  daftServer("daft", housedb)
  
  output$conn <- renderPrint(loginServer("house")())
}

# Run the application 
shinyApp(ui = ui, server = server)
