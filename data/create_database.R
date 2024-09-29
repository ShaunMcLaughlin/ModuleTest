mod_db <- RSQLite::dbConnect(RSQLite::SQLite(), "data/module_database.db")

tables <- dbListTables(mod_db)

if(!("modcars" %in% tables)) {
  dbWriteTable(mod_db, "modcars", mtcars)
}

if(!("modiris" %in% tables)) {
  dbWriteTable(mod_db, "modiris", iris)
}

dbDisconnect(mod_db)

dbConnect(mod_db)
