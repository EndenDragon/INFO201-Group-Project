# Find the amount of times each word is used from data 
#and store it in new dataframe.
data <- read.csv("./data/words_362689877751627777.csv")
unique <- table(unlist(data))
unique_words <- as.data.frame(unique)
names(unique_words)[names(unique_words) == "Var1"] <- "Words"
names(unique_words)[names(unique_words) == "Freq"] <- "Frequency"
