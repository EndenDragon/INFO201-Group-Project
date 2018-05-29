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

# Most active user at hour 00
active_users_00 <- final_data %>%
  filter(select_times == "00") %>%
  get_active_users()

# Most active user at hour 01
active_users_01 <- final_data %>%
  filter(select_times == "01") %>%
  get_active_users()

# Most active user at hour 02
active_users_02 <- final_data %>%
  filter(select_times == "02") %>%
  get_active_users()

# Most active user at hour 03
active_users_03 <- final_data %>%
  filter(select_times == "03") %>%
  get_active_users()

# Most active user at hour 04
active_users_04 <- final_data %>%
  filter(select_times == "04") %>%
  get_active_users()

# Most active user at hour 05
active_users_05 <- final_data %>%
  filter(select_times == "05") %>%
  get_active_users()

# Most active user at hour 06
active_users_06 <- final_data %>%
  filter(select_times == "06") %>%
  get_active_users()

# Most active user at hour 07
active_users_07 <- final_data %>%
  filter(select_times == "07") %>%
  get_active_users()

# Most active user at hour 08
active_users_08 <- final_data %>%
  filter(select_times == "08") %>%
  get_active_users()

# Most active user at hour 09
active_users_09 <- final_data %>%
  filter(select_times == "09") %>%
  get_active_users()

# Most active user at hour 10
active_users_10 <- final_data %>%
  filter(select_times == "10") %>%
  get_active_users()

# Most active user at hour 11
active_users_11 <- final_data %>%
  filter(select_times == "11") %>%
  get_active_users()

# Most active user at hour 12
active_users_12 <- final_data %>%
  filter(select_times == "12") %>%
  get_active_users()

# Most active user at hour 13
active_users_13 <- final_data %>%
  filter(select_times == "13") %>%
  get_active_users()

# Most active user at hour 14
active_users_14 <- final_data %>%
  filter(select_times == "14") %>%
  get_active_users()

# Most active user at hour 15
active_users_15 <- final_data %>%
  filter(select_times == "15") %>%
  get_active_users()

# Most active user at hour 16
active_users_16 <- final_data %>%
  filter(select_times == "16") %>%
  get_active_users()

# Most active user at hour 17
active_users_17 <- final_data %>%
  filter(select_times == "17") %>%
  get_active_users()

# Most active user at hour 18
active_users_18 <- final_data %>%
  filter(select_times == "18") %>%
  get_active_users()

# Most active user at hour 19
active_users_19 <- final_data %>%
  filter(select_times == "19") %>%
  get_active_users()

# Most active user at hour 20
active_users_20 <- final_data %>%
  filter(select_times == "20") %>%
  get_active_users()

# Most active user at hour 21
active_users_21 <- final_data %>%
  filter(select_times == "21") %>%
  get_active_users()

# Most active user at hour 22
active_users_22 <- final_data %>%
  filter(select_times == "22") %>%
  get_active_users()

# Most active user at hour 23
active_users_23 <- final_data %>%
  filter(select_times == "23") %>%
  get_active_users()
