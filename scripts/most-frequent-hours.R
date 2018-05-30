library(dplyr)
library(plotly)

frequent_hour_graph <- function(data, date) {
  filtered_df <- data
  filtered_df$timestamp <- as.POSIXct(filtered_df$timestamp,"Europe/London")
  attributes(filtered_df$timestamp)$tzone <- "America/Los_Angeles"
  filtered_df <- data %>%
    filter(
      grepl(paste0(date, ".*"), timestamp)
    )
  
  count_00 <- nrow(filtered_df %>% filter(grepl("^.{11}00.*$", timestamp)))
  count_01 <- nrow(filtered_df %>% filter(grepl("^.{11}01.*$", timestamp)))
  count_02 <- nrow(filtered_df %>% filter(grepl("^.{11}02.*$", timestamp)))
  count_03 <- nrow(filtered_df %>% filter(grepl("^.{11}03.*$", timestamp)))
  count_04 <- nrow(filtered_df %>% filter(grepl("^.{11}04.*$", timestamp)))
  count_05 <- nrow(filtered_df %>% filter(grepl("^.{11}05.*$", timestamp)))
  count_06 <- nrow(filtered_df %>% filter(grepl("^.{11}06.*$", timestamp)))
  count_07 <- nrow(filtered_df %>% filter(grepl("^.{11}07.*$", timestamp)))
  count_08 <- nrow(filtered_df %>% filter(grepl("^.{11}08.*$", timestamp)))
  count_09 <- nrow(filtered_df %>% filter(grepl("^.{11}09.*$", timestamp)))
  count_10 <- nrow(filtered_df %>% filter(grepl("^.{11}10.*$", timestamp)))
  count_11 <- nrow(filtered_df %>% filter(grepl("^.{11}11.*$", timestamp)))
  count_12 <- nrow(filtered_df %>% filter(grepl("^.{11}12.*$", timestamp)))
  count_13 <- nrow(filtered_df %>% filter(grepl("^.{11}13.*$", timestamp)))
  count_14 <- nrow(filtered_df %>% filter(grepl("^.{11}14.*$", timestamp)))
  count_15 <- nrow(filtered_df %>% filter(grepl("^.{11}15.*$", timestamp)))
  count_16 <- nrow(filtered_df %>% filter(grepl("^.{11}16.*$", timestamp)))
  count_17 <- nrow(filtered_df %>% filter(grepl("^.{11}17.*$", timestamp)))
  count_18 <- nrow(filtered_df %>% filter(grepl("^.{11}18.*$", timestamp)))
  count_19 <- nrow(filtered_df %>% filter(grepl("^.{11}19.*$", timestamp)))
  count_20 <- nrow(filtered_df %>% filter(grepl("^.{11}20.*$", timestamp)))
  count_21 <- nrow(filtered_df %>% filter(grepl("^.{11}21.*$", timestamp)))
  count_22 <- nrow(filtered_df %>% filter(grepl("^.{11}22.*$", timestamp)))
  count_23 <- nrow(filtered_df %>% filter(grepl("^.{11}23.*$", timestamp)))
  
  counts <- c(
    count_00,
    count_01,
    count_02,
    count_03,
    count_04,
    count_05,
    count_06,
    count_07,
    count_08,
    count_09,
    count_10,
    count_11,
    count_12,
    count_13,
    count_14,
    count_15,
    count_16,
    count_17,
    count_18,
    count_19,
    count_20,
    count_21,
    count_22,
    count_23
  )
  
  dat <- data.frame(
    Time = c("00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
             "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
             "22", "23"),
    Count = counts
  )
  ggplot(data=dat, aes(x=Time, y=Count)) +
    geom_bar(stat="identity") +
    xlab("Hour of day") + ylab("Messages Sent") +
    ggtitle(paste("Message sent distributions on", date))
}

