library(testthat)
library(testthatBaseMocking)



# For local tests (with my.func outside of the package scope to evaluate the impact of a package)
# my.func <- function() {
#   return(Sys.info()["sysname"])   # e. g. "Linux"
# }



test_that("base function can be mocked",
          with_mock(
            Sys.info = function() return(c(sysname = "Clever OS")),  # "`base::Sys.info` = ..." works neither
            
            print(my.func()),
            
            expect_equal(my.func(),   c(sysname = "Clever OS"), fixed = TRUE, info = my.func()),
            expect_equal(my.func.2(), c(sysname = "Clever OS"), fixed = TRUE, info = my.func())
          )
)
