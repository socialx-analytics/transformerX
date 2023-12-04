#' Load Zero-Shot Classification Model
#'
#' This function load a zero-shot classification model using the Python `transformers` library.
#' It initializes a zero-shot classification pipeline using a pre-trained model located at the specified `model_path`.
#'
#' @param model_path A character string specifying the path to the pre-trained model. It can be a Huggingface Repository.
#'
#' @return A Python object representing the zero-shot classification pipeline.
#' @export
#'
#' @examples
#' \dontrun{
#' model <- load_zsc_model("MoritzLaurer/mDeBERTa-v3-base-mnli-xnli")
#' }
load_zsc_model <- function(model_path) {
  # Import the transformers library using reticulate
  transformers <- reticulate::import("transformers")

  # Initialize the zero-shot classification pipeline
  model <- transformers$pipeline(
    task = "zero-shot-classification",
    model = model_path
  )

  return(model)
}
