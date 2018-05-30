library(dplyr)
# read in all data from chats and combine into one dataframe.
data1 <- read.csv("./data/messages_362689877751627777.csv")
data2 <- read.csv("./data/messages_362691650981724160.csv")
data3 <- read.csv("./data/messages_366123119464939534.csv")
data4 <- read.csv("./data/messages_369356771804053515.csv")
data_combined <- rbind(data1, data2, data3, data4)
select_times <- select(data_combined, timestamp)
select_times <- substr(select_times$timestamp, 12, 13)
select_times <- as.data.frame(select_times)

# data frame with hours in a easier format to look at and use.
final_data <- cbind(select_times, data_combined)
get_active_users <- function(data_set) {
  # get number of messages sent by each user and sort greatest to least active
  ids_only <- select(data_set, author_id)
  active <- table(unlist(ids_only))
  most_active <- as.data.frame(active)
  most_active1 <- arrange(most_active, -Freq)
  most_active1
}

# Most active user over 24 hours
full_data <- get_active_users(data_combined)

get_active_users_in_hour <- function(hour = "All") {
  if (hour == "All") {
    full_data
  } else {
    final_data %>%
      filter(select_times == hour) %>%
      get_active_users()
  }
}
