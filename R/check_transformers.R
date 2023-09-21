#' Check Python Transformers Library
#'
#' This function checks the availability of the `transformers` library from Python.
#' If it's available, it sends a success message. If there's an error during import,
#' the function captures the error and provides a message.
#'
#' @return Invisible NULL. The function primarily provides messages based on the availability of the `transformers` library.
#' @export
#'
#' @examples
#' \dontrun{
#' check_transformers()
#' }
check_transformers <- function() {
  # Attempt to import the transformers library from Python using reticulate
  tryCatch(
    {
      # Try importing the transformers library
      reticulate::import("transformers")

      # If import is successful, send a message to the console
      message("Transformers library successfully imported. You're ready to go!")
    },
    # Handle errors that occur during the import process
    error = function(e) {
      # Provide an informative message regarding the error using glue
      message(glue::glue("An error occurred while trying to import the transformers library: {e$message}."))
    }
  )
}
