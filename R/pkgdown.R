#' @importFrom magrittr %>%
#' @importFrom roxygen2 roxygenise
#' @importFrom R6 R6Class
#' @importFrom utils installed.packages
#' @import rlang
#' @import fs
#' @keywords internal
"_PACKAGE"

#' Determine if code is executed by pkgdown
#'
#' This is occasionally useful when you need different behaviour by
#' pkgdown and regular documentation.
#'
#' @export
#' @examples
#' in_pkgdown()
in_pkgdown <- function() {
  identical(Sys.getenv("IN_PKGDOWN"), "true")
}

set_pkgdown_env <- function(x) {
  old <- Sys.getenv("IN_PKGDOWN")
  Sys.setenv("IN_PKGDOWN" = x)
  invisible(old)
}

scoped_in_pkgdown <- function(scope = parent.frame()) {
  old <- set_pkgdown_env("true")
  defer(set_pkgdown_env(old), scope = scope)
}

