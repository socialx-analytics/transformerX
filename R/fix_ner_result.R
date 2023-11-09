fix_ner_result <- function(data) {
  data |>
    dplyr::group_by(group = cumsum(grepl("^B-", entity))) |>
    dplr::summarise(
      entity = first(entity),
      score = mean(score),
      word = paste(word, collapse = " "),
      .groups = 'drop'
    ) |>
    dplyr::mutate(
      word = gsub(" ##", "", word),
      word = gsub("\\[UNK\\]", "", word)
    )
}
