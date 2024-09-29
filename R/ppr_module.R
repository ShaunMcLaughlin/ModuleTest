pprUI <- function(id) {
  ns <- NS(id)
  tagList(
    titlePanel("PPR data"),
    tableOutput(ns("ppr_table"))
  )
}

pprServer <- function(id, conn) {
  moduleServer(
    id,
    function(input, output, session) {
      ppr_data <- reactive({
        if(!is.null(conn())) {
          dbGetQuery(conn(), "select * from ppr limit 5")
        } else {
          data.frame(0)
        }
      })
        
      output$ppr_table <- renderTable(ppr_data())
    }
  )
}