# Sourcing in files and libraries
library(shiny)
source("scripts/build-plots.R")

#read in all data from chats and combine into one dataframe.
data1 <- read.csv("./data/messages_362689877751627777.csv")
data2 <- read.csv("./data/messages_362691650981724160.csv")
data3 <- read.csv("./data/messages_366123119464939534.csv")
data4 <- read.csv("./data/messages_369356771804053515.csv")
data_combined <- rbind(data1, data2, data3, data4)

shinyServer(function(input, output) {
  output$most_frequent_hours <- renderPlot({
    build_most_frequent_hours_plot(data_combined, input$freqdate)
  })
  output$most_used_words <- renderPlot({
    build_most_used_words_plot(input$date, input$word_num)
  })
})
