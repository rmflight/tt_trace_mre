#' does something
#'
#' this function calls \code{f2}, some of the time
#'
#' @param use_f2 should \code{f2} be called or not
#' @export
#' @return nothing
f1 <- function(use_f2 = FALSE){
  if (use_f2) {
    f2()
  }
}

#' does something else
#'
#' calls \code{f1} all of the time
#'
#' @export
#' @return nothing
f2 <- function(){
  f1(use_f2 = FALSE)
}

count_env <- new.env()
count_env$f1 <- 0

#' add f1
#'
#' adds 1 to f1
#'
#' @export
#' @return nothing
add_f1 <- function(){
  f1_val <- get("f1", envir = ttTraceMRE:::count_env)
  assign("f1", f1_val + 1, envir = ttTraceMRE:::count_env)
}
