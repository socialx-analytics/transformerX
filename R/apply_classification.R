#' Apply Text Classification
#'
#' This function applies text classification on a given text using the provided model.
#' It returns a data frame with the model's outputs.
#'
#' @param model A pre-trained model that supports text classification.
#' @param text A character vector containing the text samples to classify.
#'
#' @return A data frame with the model's outputs.
#' @export
#'
#' @examples
#' \dontrun{
#' model <- load_ner_model("lxyuan/distilbert-base-multilingual-cased-sentiments-student")
#' text <- c("This is a test.", "Another sample text.")
#' apply_classification(model, text)
#' }
apply_classification <- function(model, text) {
  # Apply the model to the input text
  outputs <- model(text)

  # Bind the rows of the output together into a single data frame
  results <- outputs |>
    dplyr::bind_rows()

  return(results)
}
