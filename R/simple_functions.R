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

f1_count <- 0

init_f_count <- function(){
  tt_pos <- match("package:ttTraceMRE", search())
  assign("f1_count", 0, envir = as.environment(tt_pos))
}


#' add f1
#'
#' adds 1 to f1
#'
#' @export
#' @return nothing
add_f1 <- function(){
  tt_pos <- match("package:ttTraceMRE", search())
  f1_val <- get("f1_count", envir = as.environment(tt_pos))
  assign("f1_count", f1_val + 1, pos = tt_pos)
}
