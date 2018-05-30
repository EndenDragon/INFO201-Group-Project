library(dplyr)

#read in all data from chats and combine into one dataframe.
data1 <- read.csv("./data/messages_362689877751627777.csv")
data2 <- read.csv("./data/messages_362691650981724160.csv")
data3 <- read.csv("./data/messages_366123119464939534.csv")
data4 <- read.csv("./data/messages_369356771804053515.csv")
data_combined <- rbind(data1, data2, data3, data4)

#select timestamp only from data and make new dataframe
select_times <- select(data_combined, timestamp)
select_times <- substr(select_times$timestamp, 12, 13)
select_times <- as.data.frame(select_times)

#write a function that counts how many times a certain hour has a chat
get_total <- function(hour) {
  hour_count1 <- select_times[select_times$select_times == hour, ]
  data_count <- as.data.frame(hour_count1)
  number <- nrow(data_count)
  number
}

# put all hours in a list (in order by hour)
max_numbers <- list(
  hour00 = get_total("00"), hour01 = get_total("01"), hour02 = get_total("02"),
  hour03 = get_total("03"), hour04 = get_total("04"), hour05 = get_total("05"),
  hour06 = get_total("06"), hour07 = get_total("07"), hour08 = get_total("08"),
  hour09 = get_total("09"), hour10 = get_total("10"), hour11 = get_total("11"),
  hour12 = get_total("12"), hour13 = get_total("13"), hour14 = get_total("14"),
  hour15 = get_total("15"), hour16 = get_total("16"), hour17 = get_total("17"),
  hour18 = get_total("18"), hour19 = get_total("19"), hour20 = get_total("20"),
  hour21 = get_total("21"), hour22 = get_total("22"), hour23 = get_total("23")
)

# create data frame from least active hour to most active hour
max_frame <- as.data.frame(max_numbers)
max_frame <- sort(max_frame)
View(max_frame)
