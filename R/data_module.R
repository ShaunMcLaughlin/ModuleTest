dataUI <- function(id, title) {
  ns <- NS(id)
  tagList(
    titlePanel(sprintf("%s data", title)),
    tableOutput(ns("data_table"))
  )
}

dataServer <- function(id, conn, table) {
  moduleServer(
    id,
    function(input, output, session) {
      data <- reactive({
        if (!is.null(conn())) {
          dbGetQuery(conn(), sprintf("select * from %s limit 5", table))
        } else {
          data.frame(0)
        }
      })
      output$data_table <- renderTable(data())
    }
  )
}