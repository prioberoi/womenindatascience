shinyUI(navbarPage("Women in Data Science",
  
  tabPanel("Line Graph",
    htmlOutput("lineGraph")
  ),
  
  tabPanel("Bubble Chart",
    htmlOutput("bubbleChart")
  )
  
))