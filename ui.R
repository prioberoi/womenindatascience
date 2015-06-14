shinyUI(navbarPage("Women in Data Science",
  
  tabPanel("Dashboard",
  
    htmlOutput("dashboard", align="center"),
    div(img(src="stat_1_3.png"), img(src="stat_2_1.png"), img(src="stat_3.png"), align="center", img(src="logo_060815.jpeg", width=300, align="right"))
    #HTML('<div><img hspace="100" src="stat_1_3.png" hspace="75"/><img src="stat_2_1.png" hspace="75"/><img src="stat_3.png"/></p>'),
    #img(src="logo_060815.jpeg", width=300, align="right")
    #p('National Science Foundation, National Center for Science and Engineering Statistics. 2015. Women, Minorities, and Persons with Disabilities in Science and Engineering: 2015. Special Report NSF 15-311. Arlington, VA. Available at http://www.nsf.gov/statistics/wmpd/.')
  )
  
))