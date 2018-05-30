# Find the amount of times each word is used from data 
# and store it in new dataframe.
data_all_time <- read.csv(
  "./data/words_362689877751627777.csv",
  stringsAsFactors = FALSE
)

# Specifies the `date` parameter in the format of `yyyy-mm-dd`. For instance, to
# refer to January 1, 2018, use `2018-01-01`
# The `date` parameter is optional. If it is unset, or the parameter is set to
# `all`, then this function will process messages sent at all times.
word_freq <- function(date = "all") {
  if (date == "all") {
    data <- data_all_time
  } else {
    data <- data_all_time[data_all_time$date == date, ]
  }
  unique <- table(unlist(data$word))
  unique_words <- as.data.frame(unique)
  names(unique_words)[names(unique_words) == "Var1"] <- "Words"
  names(unique_words)[names(unique_words) == "Freq"] <- "Frequency"
  unique_words
}
