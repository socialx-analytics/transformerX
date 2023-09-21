#' Setup Python Virtual Environment for Using Transformer
#'
#' This function sets up a new Python virtual environment for using Huggingface Transformer library in R.
#' It checks for the presence of Python, validates the reticulate version,
#' and installs packages from a provided requirements.txt file.
#'
#' @param env_name Character. Name for the new virtual environment.
#' @param req_txt_path Character. Path to the requirements.txt file for package installation.
#'
#' @return Invisible NULL. The function primarily has side effects of setting up and activating the virtual environment.
#' @export
#'
#' @examples
#' \dontrun{
#' setup_environment("my_env", "requirements.txt")
#' }
setup_environment <- function(env_name, req_txt_path = "requirements.txt") {
  # Check Python Version and Compability
  transformerX::check_python()

  # Validate reticulate version
  if (!identical(as.character(utils::packageVersion("reticulate")), "1.31")) {
    stop(
      "Please ensure you have reticulate version 1.31 loaded. ",
      "Run `install.packages('reticulate')` to install."
    )
  }

  # Confirm existence of requirements.txt file
  if (!file.exists(req_txt_path)) {
    stop("Provided requirements.txt file path does not exist.")
  }

  # Create virtual environment
  reticulate::virtualenv_create(env_name)

  # Obtain path of Python in created virtual environment
  python_path <- reticulate::virtualenv_python(env_name)

  # Formulate command to install packages from requirements.txt
  command <- glue::glue("{python_path} -m pip install -r {req_txt_path}")

  # Install packages
  system(command, ignore.stdout = FALSE, ignore.stderr = FALSE)

  # Use the created virtual environment in R session
  reticulate::use_virtualenv(env_name, required = TRUE)

  # Message user about completion
  message(glue::glue("Virtual environment '{env_name}' has been created and activated."))
}
