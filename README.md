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

## Setup Transformer

There are several ways to setup Transformer models. You can choose to use the base Python or the Anaconda distribution. The simplest way is to use Miniconda which can be installed directly from Reticulate.

```{r}
# Installing Miniconda using reticulate
reticulate::install_miniconda()

# Creating a new conda environment named 'llm'
# Feel free to adjust the environment name as needed
conda_create("llm")

# Defining the required packages for the environment
requirements <- c("pytorch", "transformers", "huggingface-hub")

# Installing each package in the 'llm' environment
for (package in requirements) {
  reticulate::conda_install("llm", package)
}

# Note: Restart your R session after running this script for changes to take effect

# Setting the conda environment to 'bert'
# Ensure to change this to the name of your created environment if different
reticulate::use_condaenv("bert")

# Checking if the transformers are correctly installed and configured
transformerX::check_transformers()
```

If the Transformers library is successfully imported, you're ready to go!

## Example Usage

Here's an example of how to use `transformerX` for Zero Shoot Classification:

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
