daftUI <- function(id) {
  ns <- NS(id)
  tagList(
    titlePanel("DAFT data"),
    tableOutput(ns("daft_table"))
  )
}

daftServer <- function(id, conn) {
  moduleServer(
    id,
    function(input, output, session) {
      daft_data <- reactive({
        if (!is.null(conn())) {
          dbGetQuery(conn(), "select * from daft limit 5")
        } else {
          data.frame(0)
        }
      })
      output$daft_table <- renderTable(daft_data())
    }
  )
}