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
