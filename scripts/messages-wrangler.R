# Messages Wrangler
#
# This program contains a collection of functions that allows you to process
# chat messages and transforms them into a form that is suitable for analyzing.

# Dependencies

# If package `tm` is not installed, install it
if (!require("tm")) {
  install.packages("tm")
}
# If package `pluralize` is not installed, install it
if (!require("pluralize")) {
  # If package `devtools` is not installed, install it
  if (!require("devtools")) {
    install.packages("devtools")
  }
  devtools::install_github("hrbrmstr/pluralize")
}

library(dplyr)
library(tm)
library(pluralize)

# Custom Rules for `pluralize` library
add_singular_rule("christmas", "christmas")

# Words with length longer than this number will be ignored
long_word_length <- 15

# A vector of common words. These words do not have strong effect on a
# sentence's meaning and should be removed from the list of words.
words_to_remove <- c(
  "the", "a", "an", # Articles
  "am", "are", "be", "is", # The "be" family
  "to", "in", "on", "of", "at", "or", "by", # Prepositions
  "and", "that", "for", "but", "so", "if", # Conjunctions
  "fuck", "shit" # Bad words
)

# Functions

# Converts all characters in every message in the given vector to lower case.
#
# Parameters:
#   messages - a vector storing the messages to be processed
# Returns:
#   a vector in the same structure as the one passed in as parameter, with all
#   characters in lower case
to_lower_case <- function(messages) {
  tolower(messages)
}

# Removes all punctuations in every string in the given vector.
#
# Parameters:
#   strings - a vector storing the strings to be processed
# Returns:
#   a vector storing all the strings in the vector passed in as parameter,
#   without any punctuation
remove_punctuations <- function(strings) {
  removePunctuation(strings)
}

# Splits all messages in the given vector into separate words.
# Duplicated words will be kept, so there might be more than one occurrence of
# the same word in the vector returned.
#
# Parameters:
#   messages - a vector storing the messages to be processed
# Returns:
#   a vector storing all individual words that appear in the vector passed in
to_vector_of_words <- function(messages) {
  words <- strsplit(messages, "[[:space:]]") %>%
    unlist()
  words[words != ""]
}

# Converts all words in the given vector into singular form.
#
# Parameters:
#   words - a vector storing the words to be processed
# Returns:
#   a vector storing all the words in the vector passed in as parameter, with
#   all words in singular form
to_singular <- function(words) {
  singularize(words)
}

# Removes any unwanted words.
#
# Parameters:
#   words - a vector storing the words to be processed
# Returns:
#   a vector storing all the words in the vector passed in as parameter except
#   the wanted words
remove_unwanted_words <- function(words) {
  words <- words[!(words %in% words_to_remove)]
  words <- words[nchar(words) <= long_word_length]
  words
}

# Given a data frame storing messages information, returns another data frame
# storing every word in all messages in the given one, along with the date when
# the word is being sent.
#
# Parameters:
#   messages_df - a data frame storing the messages and their information
# Returns:
#   a new data frame storing all words in the messages with the date when the
#   word is sent
get_words_in_each_day <- function(messages_df) {
  messages_df <- messages_df %>%
    select("timestamp", "content")
  messages_df$timestamp <- substr(messages_df$timestamp, 1, 10)
  result <- data.frame(matrix(nrow = 0, ncol = 2))
  colnames(result) <- c("date", "word")
  for (date in unique(messages_df$timestamp)) {
    messages_in_the_day <- messages_df %>%
      filter(messages_df$timestamp == date)
    word <- messages_in_the_day$content %>%
      to_lower_case() %>%
      remove_punctuations() %>%
      to_vector_of_words() %>%
      to_singular() %>%
      remove_unwanted_words()
    words_in_the_day_df <- data.frame(date, word)
    result <- rbind(result, words_in_the_day_df)
  }
  result
}

# Generates a CSV file storing all words in all messages.
generate_csv_file <- function() {
  messages_df <-
    read.csv("data/messages_362689877751627777.csv", stringsAsFactors = FALSE)
  words_df <- get_words_in_each_day(messages_df)
  write.csv(
    words_df, file = paste0("data/words_362689877751627777.csv"),
    row.names = FALSE
  )
}
