context("number of calls")

test_that("f1 FALSE", {
  .count <- 0

  trace(f1, tracer = function() {.count <<- .count +1}, print = FALSE)

  f1()
  expect_equal(1, .count)
})
