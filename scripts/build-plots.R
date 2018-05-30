# Sourcing in files and libraries
library(dplyr)
library(ggplot2)
source("scripts/most-active-users.R")
source("scripts/most-frequent-hours.R")
source("scripts/most-used-words.R")

build_most_used_words_plot <- function(selected_date, word_num) {
  words_data <- word_freq(date = selected_date) %>%
    arrange(-Frequency)
  words_data <- words_data[1:word_num, ]
  ggplot(data = words_data) +
    geom_point(mapping = aes(x = Words, y = Frequency))
}
