context("number of calls")

count_env <- new.env()

count_env$f1 <- count_env$f2 <- 0

trace(f1, tracer = quote(count_env$f1 <- count_env$f1 + 1), print = FALSE)
trace(f2, tracer = quote(count_env$f2 <- count_env$f2 + 1), print = FALSE)

test_that("f1 FALSE", {
  f1()
  expect_equal(1, count_env$f1)
  expect_equal(0, count_env$f2)
})

count_env$f1 <- count_env$f2 <- 0

test_that("f1 TRUE", {
  f1(TRUE)
  expect_equal(2, count_env$f1)
  expect_equal(1, count_env$f2)
})

count_env$f1 <- count_env$f2 <- 0

test_that("f2 works", {
  f2()
  expect_equal(1, count_env$f1)
  expect_equal(1, count_env$f2)
})
