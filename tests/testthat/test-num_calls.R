context("number of calls")

.f1 <- .f2 <- 0

trace(f1, tracer = function() {.f1 <<- .f1 + 1}, print = FALSE)
trace(f2, tracer = function() {.f2 <<- .f2 + 1}, print = FALSE)

test_that("f1 FALSE", {
  f1()
  expect_equal(1, .f1)
  expect_equal(0, .f2)
})

.f1 <- .f2 <- 0

test_that("f1 TRUE", {
  f1(TRUE)

  expect_equal(2, .f1)
  expect_equal(1, .f2)
})

.f1 <- .f2 <- 0

test_that("f2 works", {
  f2()
  expect_equal(1, .f1)
  expect_equal(1, .f2)
})
