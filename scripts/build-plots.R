# Sourcing in files and libraries
library(dplyr)
library(ggplot2)
source("scripts/most-active-users.R")
source("scripts/most-frequent-hours.R")
source("scripts/most-used-words.R")

build_most_active_users_plot <- function(selected_hour, user_num) {
  active_users_data <- get_active_users_in_hour(selected_hour)[1:user_num, ]
  plot_title <-
    paste(user_num, "Most Active Users in the UW Discord Channel")
  if (selected_hour != "All") {
    plot_title <-
      paste0(plot_title, " in ", selected_hour, ":00-", selected_hour, ":59")
  }
  ggplot(data = active_users_data) +
    geom_bar(mapping = aes(x = Var1, y = Freq), stat = "identity") +
    labs(title = plot_title, x = "User", y = "Messages Sent")
}

build_most_used_words_plot <- function(selected_date, word_num) {
  words_data <- word_freq(date = selected_date) %>%
    arrange(-Frequency)
  words_data <- words_data[1:word_num, ]
  plot_title <-
    paste("Frequency of Top", word_num, "Words in the UW Discord Channel")
  if (selected_date != "All") {
    plot_title <- paste(plot_title, "on", selected_date)
  }
  ggplot(data = words_data) +
    geom_bar(mapping = aes(x = Words, y = Frequency), stat = "identity") +
    labs(title = plot_title)
}

build_most_frequent_hours_plot <- function(data, date) {
  return(frequent_hour_graph(data, date))
}
