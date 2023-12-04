#' Apply Zero-Shot Classification
#'
#' This function applies zero-shot classification on a given text using the provided model and candidate labels.
#' It returns a tidy data frame (tibble) with the input text, scores for each candidate label, and the label
#' with the highest score for each text.
#'
#' @param model A pre-trained model that supports zero-shot classification.
#' @param text A character vector containing the text samples to classify.
#' @param candidate_labels A character vector containing the candidate labels for classification.
#'
#' @return A tibble with columns: `text` (input text), scores for each candidate label, and `label` (label with the highest score).
#' @export
#'
#' @examples
#' \dontrun{
#' model <- load_zsc_model("MoritzLaurer/mDeBERTa-v3-base-mnli-xnli")
#' text <- "This is a test."
#' labels <- c("Label1", "Label2", "Label3")
#' apply_zsc(model, text, labels)
#' }
apply_zsc <- function(model, text, candidate_labels) {
  # Apply the model to the input text and candidate labels
  output <- model(text, candidate_labels)

  # Convert the output to a tidy data frame and perform reshaping and processing
  df_output <- tibble::tibble(
    text = text,
    labels = unlist(output$labels),
    score = unlist(output$score)
  ) |>
    tidyr::pivot_wider(
      names_from = "labels",
      values_from = "score"
    ) |>
    dplyr::rowwise() |>
    dplyr::mutate(label = names(dplyr::across(-text))[which.max(dplyr::across(-text))])

  return(df_output)
}
