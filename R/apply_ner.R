#' Apply Named Entity Recognition (NER)
#'
#' This function applies NER on a given text using the provided model.
#' It returns a tidy data frame (tibble) containing recognized entities, their scores, and the corresponding words.
#'
#' @param model A pre-trained model that supports named entity recognition.
#' @param text A character vector containing the text samples to extract entities from.
#'
#' @return A tibble with columns: `entity` (recognized entity), `score` (confidence score), and `word` (corresponding word or phrase in the text).
#' @export
#'
#' @examples
#' \dontrun{
#' model <- load_ner_model("https://huggingface.co/dslim/bert-base-NER")
#' texts <- c("John lives in New York.", "Alice works at Apple.")
#' apply_ner(model, texts)
#' }
apply_ner <- function(model, text) {

  # Apply the model to the input text
  output <- dplyr::bind_rows(model(text))

  # Convert the output to a tidy data frame
  df_output <- fix_ner_result(output)

  return(df_output)
}
