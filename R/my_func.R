# Function under test (returns a named string)
my.func <- function() {
  return(Sys.info()["sysname"])   # e. g. "Linux"
}

my.func.2 <- my.func <- function() {
  return(base::Sys.info()["sysname"])   # e. g. "Linux"
}



