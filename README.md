# testthat trace MRE

a minimal rep example of using `trace` to count function evals in `testthat` unit tests

## First Try

Based on [this](https://gist.github.com/rmflight/20f10db5c27b3623c321), I
implemented this:

```r
count_env <- new.env()

count_env$f1 <- count_env$f2 <- 0

trace(f1, tracer = quote(count_env$f1 <- count_env$f1 + 1), print = FALSE)
trace(f2, tracer = quote(count_env$f2 <- count_env$f2 + 1), print = FALSE)

test_that("f1 FALSE", {
  f1()
  expect_equal(1, count_env$f1)
  expect_equal(0, count_env$f2)
})
```

which has the problem of:

```r
object 'count_env' not found
```

## Second Major Try

```r
test_that("f1 FALSE", {
  count_env <- new.env()

  count_env$f1 <- 0

  trace(f1, tracer = quote(count_env$f1 <<- count_env$f1 + 1), print = FALSE)

  f1()
  expect_equal(1, count_env$f1)
})
```

Has the same problem.
