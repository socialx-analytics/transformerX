#' Welcome Message for transformerX Package
#'
#' This function displays a welcome message for users of the transformerX package.
#' It provides information about the development stage of the package and encourages
#' users to report bugs or issues.
#'
#' @return An invisible NULL. The primary side effect is displaying a message.
#' @export
#'
#' @examples
#' \dontrun{
#' helloX()
#' }
helloX <- function() {
  # Display the welcome message
  message(
    "Hi! Welcome to transformerX. ",
    "Note: This package is currently in the development stage. ",
    "I hope you can enjoy it, and if you encounter any bugs or issues, ",
    "please don't hesitate to raise an issue."
  )
}
helloX()
