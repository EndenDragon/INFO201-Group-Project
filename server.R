# Sourcing in files and libraries
library(shiny)
source("scripts/build-plots.R")

shinyServer(function(input, output) {
  output$most_used_words <- renderPlot({
    build_most_used_words_plot(input$date, input$word_num)
  })
})
