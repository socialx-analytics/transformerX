#' Setup Reticulate for Using Transformer
#'
#' This function checks and sets up the `reticulate` package for using Huggingface Transformer library in R.
#' It verifies the presence of Python, ensures that `reticulate` is installed,
#' and also checks its version. If not installed or if the version is incorrect,
#' it installs the specific desired version.
#'
#' @return Invisible NULL. The function primarily has side effects of installing and setting up the package.
#' @export
#'
#' @examples
#' \dontrun{
#' setup_reticulate()
#' }
setup_reticulate <- function() {
  # Check Python Version and Compability
  transformerX::check_python()

  # Check if "reticulate" package is installed
  if (!requireNamespace("reticulate", quietly = TRUE)) {
    # Install "devtools" if not available (required for specific version installation)
    if (!requireNamespace("devtools", quietly = TRUE)) {
      utils::install.packages("devtools")
    }

    message("Installing reticulate version 1.31")
    devtools::install_version("reticulate", version = "1.31")
    library(reticulate)

    # Check if the installed version of "reticulate" is not 1.31
  } else if (!identical(as.character(utils::packageVersion("reticulate")), "1.31")) {
    warning(
      "You don't have the desired version of reticulate. ",
      "Please use devtools::install_version('reticulate', version = '1.31') ",
      "to get the tested version."
    )
  } else {
    message("Good! You have the required version of reticulate that has been tested.")
  }
}
