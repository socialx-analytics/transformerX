#' Check Installed Python Version Suitable to run Transformer Library or Not
#'
#' This function checks the installed version of Python. If Python is not available,
#' it prompts the user to install version 3.10. It further checks the Python version
#' to ensure compatibility and provides recommendations.
#'
#' @return Invisible NULL. The function primarily provides messages and may stop execution if Python is not available.
#' @export
#'
#' @examples
#' \dontrun{
#' check_python()
#' }
check_python <- function() {
  # Check if Python is available
  if (!reticulate::py_available(initialize = TRUE)) {
    stop(
      "Python is not installed. Consider installing version 3.10 using: ",
      "`install_python(version = '3.10:latest')`"
    )
  }

  # Extract the current Python version
  python_version <- as.character(reticulate::py_version())

  # Parse the major and minor version numbers
  version_parts <- as.integer(unlist(strsplit(python_version, "\\.")))

  # Check if Python major version is 3
  if (version_parts[1] == 3) {
    # Check if minor version is above 3.11
    if (version_parts[2] > 11) {
      message(
        "As of 21/09/2023, certain packages may not work with Python versions above 3.11. ",
        "We recommend version 3.10. Install it using: `install_python(version = '3.10:latest')` ",
        "Refer to reticulate's documentation if any errors arise."
      )

      # Check if minor version is not 3.10
    } else if (version_parts[2] != 10) {
      message("We recommend using Python version 3.10 for optimal compatibility.")

      # If version is 3.10
    } else {
      message("You're good to go!")
    }
  }
}
