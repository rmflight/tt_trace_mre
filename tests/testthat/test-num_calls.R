context("number of calls")

tt_pos <- match("package:ttTraceMRE", search())
trace(f1, tracer = quote(add_f1()), print = FALSE, where = as.environment(tt_pos))

test_that("f1 FALSE", {
  f1()
  expect_equal(1, ttTraceMRE:::count_env$f1)
})
