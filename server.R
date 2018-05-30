# Sourcing in files and libraries
library(shiny)
source("scripts/build-plots.R")

shinyServer(function(input, output) {
  output$most_active_users <- renderPlot({
    build_most_active_users_plot(input$active_hour, input$active_user_num)
  })
  output$most_used_words <- renderPlot({
    build_most_used_words_plot(input$date, input$word_num)
  })
})
