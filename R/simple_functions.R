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
