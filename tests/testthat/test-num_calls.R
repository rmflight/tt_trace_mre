context("number of calls")

test_that("f1 FALSE", {
  count_env <- new.env()

  count_env$f1 <- 0

  trace(f1, tracer = quote(count_env$f1 <<- count_env$f1 + 1), print = FALSE)

  f1()
  expect_equal(1, count_env$f1)
})
