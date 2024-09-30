loginUI <- function(id) {
  ns <- NS(id)
  tagList(
    textInput(ns("username"), "Enter your username:"),
    passwordInput(ns("password"), "Enter your password:"),
    actionButton(ns("go"), "Login"),
  fluidRow(
    verbatimTextOutput(ns("conn"))
  )
  )
}

loginServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      housedb <- eventReactive(input$go, {
        if (input$username == "shaun" && input$password == "secret") {
          DBI::dbConnect(RSQLite::SQLite(), 'data/module_database.db')
        } else {
          NULL
        }
        
      })
      
      output$conn <- renderPrint(housedb())
      
      return(housedb)
    }
  )
}


