# Sourcing in file and libraries
library(shiny)
source("scripts/most-used-words.R")

shinyUI(
  navbarPage(
    theme = "style.css",
    "The Dig on the Unofficial UW Discord Server",
    
    # Home tab
    tabPanel(
      "Home",
      includeMarkdown("README.md")
    ),
    
    # Most active users tab
    tabPanel(
      "Active Users",
      titlePanel("Most Active Users"),
      sidebarLayout(
        sidebarPanel(
          
        ),
        mainPanel(
          
        )
      )
    ),
    
    # Most Frequent Hours tab
    tabPanel(
      "Frequent Hours",
      titlePanel("Most Frequent Hours"),
      sidebarLayout(
        sidebarPanel(
          
        ),
        mainPanel(
          
        )
      )
    ),
    
    # Most Used Words tab
    tabPanel(
      "Words Usage",
      titlePanel("Most Used Words"),
      sidebarLayout(
        sidebarPanel(
          p(paste(
            "In this tab, you can see statistics on words sent by the users in",
            "the Discord channel. You can find which words are used most",
            "frequently in the channel's messages."
          )),
          p(paste(
            "You can choose a specific date below to see statistics of",
            "messages that were sent in that date only."
          )),
          p(paste(
            "The statistics shows that some words are mentioned more often in",
            "specific days. For example, on the Christmas day, the word",
            "'Christmas' was sent very frequently, but on other days, it was",
            "not used commonly."
          )),
          selectInput(
            "date",
            "Date",
            get_dates(),
            selected = "All"
          )
        ),
        mainPanel(
          
        )
      )
    )
  )
)