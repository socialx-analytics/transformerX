#' Load Text Classification Model
#'
#' This function load a text classification model using the Python `transformers` library.
#' It takes a model path as an argument and initializes the model and tokenizer from the `transformers` library.
#'
#' @param model_path A character string specifying the path to the pre-trained model and tokenizer. It can be a Huggingface Repository.
#'
#' @return A Python object representing the text classification pipeline.
#' @export
#'
#' @examples
#' \dontrun{
#' model <- loaf_classification_model("path/to/pretrained/model")
#' }
load_classification_model <- function(model_path) {
  # Import the transformers library using reticulate
  transformers <- reticulate::import("transformers")

  # Initialize the text classification pipeline
  model <- transformers$pipeline(
    task = "text-classification",
    model = transformers$AutoModelForSequenceClassification$from_pretrained(model_path),
    tokenizer = transformers$AutoTokenizer$from_pretrained(model_path)
  )

  return(model)
}
