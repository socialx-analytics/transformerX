fix_ner_result <- function(data) {
  data |>
    group_by(group = cumsum(grepl("^B-", entity))) |>
    summarise(
      entity = first(entity),
      score = mean(score),
      word = paste(word, collapse = " "),
      .groups = 'drop'
    ) |>
    mutate(
      word = gsub(" ##", "", word),
      word = gsub("\\[UNK\\]", "", word)
    )
}
