loginUI <- function(id) {
  ns <- NS(id)
  tagList(
    textInput(ns("username"), "Enter your username:"),
    passwordInput(ns("password"), "Enter your password:"),
    actionButton(ns("go"), "Login")
  )
}

loginServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      housedb <- eventReactive(input$go, ({
        if (input$username == "shaun" && input$password == "secret") {
          DBI::dbConnect(RSQLite::SQLite(),'~/Rwork/dublin_houseprice_analysis/data/houseprice.db')
        } else {
          NULL
        }
        
      }))
      
      return(housedb)
    }
  )
}


