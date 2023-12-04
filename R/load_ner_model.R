#' Load Named Entity Recognition (NER) Model
#'
#' This function loads a NER model using the Python `transformers` library.
#' It takes a model path as an argument and initializes the model and tokenizer from the `transformers` library.
#'
#' @param model_path A character string specifying the path to the pre-trained model and tokenizer. It can be a Huggingface Repository.
#'
#' @return A Python object representing the NER pipeline.
#' @export
#'
#' @examples
#' \dontrun{
#' model <- load_ner_model("https://huggingface.co/dslim/bert-base-NER")
#' }
load_ner_model <- function(model_path) {
  # Import the transformers library using reticulate
  transformers <- reticulate::import("transformers")

  # Initialize the NER pipeline
  model <- transformers$pipeline(
    task = "ner",
    tokenizer = transformers$BertTokenizer$from_pretrained(model_path),
    model = transformers$BertForTokenClassification$from_pretrained(model_path)
  )

  return(model)
}
