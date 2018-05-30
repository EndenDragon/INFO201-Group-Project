# Sourcing in file and libraries
library(shiny)

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
          
        ),
        mainPanel(
          
        )
      )
    )
  )
)