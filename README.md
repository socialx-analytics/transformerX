# transformerX

`transformerX` is an R package designed to facilitate the setup and use of the Hugging Face Transformers library. This package provides a convenient interface for leveraging transformer models in your R projects.

## Getting Started

Install the **`devtools`** package if you haven't already:

```{r}
install.packages("devtools")
```

Install `transformerX` from its GitHub repository:

```{r}
devtools::install_github("socialx-analytics/transformerX")
```

Check your Python version:

```{r}
transformerX::check_python()
```

Setup `reticulate` (Python integration with R):

```{r}
transformerX::setup_reticulate()
```

Setup the Python environment:

```{r}
transformerX::setup_environment()
```

Check if `transformerX` can access the transformer library:

```{r}
transformerX::check_transformers()
```

If the Transformers library is successfully imported, you're ready to go!

## Example Usage

Here's an example of how to use `transformerX`:

```{r}
# Load necessary libraries
library(purrr) 
library(transformerX)  

# Input text
text <- c(
  "Gak Mood Makan",
  "Otw Sekolah", 
  "Makasih Bebeb udah Ditraktir"
)

# Load a Model
zs_classifier <- load_zsc_model("ilos-vigil/bigbird-small-indonesian-nli")


# Apply the "apply_zsc" function to each element of the "text" vector
output <- purrr::map_dfr(
  .x = text,
  .f = apply_zsc,
  model = zs_classifier,
  candidate_labels = c("Senang", "Sedih", "Netral")
)

```

## **Support**

For any questions, issues, or feedback, please [**open an issue**](https://github.com/socialx-analytics/transformerX/issues) on our GitHub repository.
