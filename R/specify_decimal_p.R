#' @title Custom function for getting specified number of decimal places in
#'   results for p-value
#' @name specify_decimal_p
#' @aliases specify_decimal_p
#' @author Indrajeet Patil
#'
#' @description Function to format an R object for pretty printing with a
#'   specified (`k`) number of decimal places. The function also allows really
#'   small *p*-values to be denoted as `"p < 0.001"` rather than `"p = 0.000"`.
#'   Note that if `p.value` is set to `TRUE`, the minimum value of `k` allowed
#'   is `3`. If `k` is set to less than 3, the function will ignore entered `k`
#'   value and use `k = 3` instead.
#'
#' @param x A numeric variable.
#' @param k Number of digits after decimal point (should be an integer)
#'   (Default: `k = 3`).
#' @param p.value Decides whether the number is a p-value (Default: `FALSE`).
#'
#' @return Formatted numeric values.
#'
#' @examples
#' 
#' groupedstats::specify_decimal_p(x = 0.00001, k = 2, p.value = TRUE)
#' groupedstats::specify_decimal_p(x = 0.008, k = 2, p.value = TRUE)
#' groupedstats::specify_decimal_p(x = 0.008, k = 3, p.value = FALSE)
#' @export

# function body
specify_decimal_p <- function(x,
                              k = 3,
                              p.value = FALSE) {

  # for example, if p.value is 0.002, it should be displayed as such
  if (k < 3 && isTRUE(p.value)) {
    k <- 3
  }

  # formatting the output properly
  output <-
    base::trimws(
      x = base::format(
        x = base::round(x = x, digits = k),
        nsmall = k
      ),
      which = "both"
    )
  # if it's a p-value, then format it properly
  if (isTRUE(p.value)) {
    # determing the class of output
    if (output < 0.001) {
      output <- "< 0.001"
    }
  }
  # this will return a character
  return(output)
}
