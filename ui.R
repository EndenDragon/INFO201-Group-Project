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
          p(paste(
            "In this tab, you can see the most active users on the UW Discord",
            "channel."
          )),
          p(paste(
            "You can select a number of hour, so you can see who are the most",
            "active users in that hour."
          )),
          selectInput(
            "active_hour",
            "Hour",
            c("All", seq(0, 23, 1) %>% formatC(width = 2, flag = "0")),
            "All"
          ),
          sliderInput(
            "active_user_num",
            "Number of Users",
            min = 2,
            max = 50,
            value = 20
          )
        ),
        mainPanel(
          p(paste(
            "Please wait while the plot loads up. It should take less than a",
            "minute."
          )),
          plotOutput("most_active_users")
        )
      )
    ),
    
    # Most Frequent Hours tab
    tabPanel(
      "Frequent Hours",
      titlePanel("Most Frequent Hours"),
      sidebarLayout(
        sidebarPanel(
          p(paste(
            "Here you can see which hours of the day are the most active in",
            "the Discord server. Bars represent the number of messages sent",
            "in the particular hour."
          )),
          p(paste(
            "Select a date to view the messages distribution."
          )),
          selectInput(
            "freqdate",
            "Date",
            get_dates(),
            selected = "2017-12-25"
          )
        ),
        mainPanel(
          plotOutput("most_frequent_hours")
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
            "specific days. For example, on the first day of instruction in",
            "Winter 2018 (2018-01-03), the word 'textbook' was frequently",
            "mentioned; but in other days, the word was not commonly used."
          )),
          selectInput(
            "date",
            "Date",
            get_dates(),
            selected = "All"
          ),
          sliderInput(
            "word_num",
            "Number of Words",
            min = 2,
            max = 50,
            value = 20
          )
        ),
        mainPanel(
          p(paste(
            "Please wait while the statistics plot loads up. It should take",
            "less than a minute."
          )),
          plotOutput("most_used_words")
        )
      )
    )
  )
)
