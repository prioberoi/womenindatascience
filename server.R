library(shiny)
library(googleVis)

shinyServer(
  function(input,output) {
  
    data1 <- read.csv("tab9-2.csv")
    data1.t <- t(data1)
    colnames(data1.t) = data1.t[1,]
    data1.t.2 <- as.data.frame(data1.t[2:11,],stringsAsFactors=FALSE)
    
    data2 <- read.csv("tab9-9.1.csv",header=TRUE,stringsAsFactors=FALSE)
    
    output$lineGraph <- renderGvis({
      year <- as.numeric(c("2004","2005","2006","2007","2008","2009","2010","2011","2012","2013"))
      data1.t.2 <- cbind(year,data1.t.2)
      data1.t.2[,2:25] <- lapply(data1.t.2[,2:25],function(data1.t.2){as.numeric(gsub(",", "", data1.t.2))})
      graph <- gvisLineChart(data1.t.2,xvar="year",yvar=c("All occupations","Management, professional, and related occupations","Management, business, and financial operations occupations",
                                                          "Professional and related occupations","Biological and life scientist","Dietitian","Economist and market and survey researcher",
                                                          "Engineering and related technologist or technician","Engineer","Health technologist or technician","Lawyer or judge",
                                                          "Mathematical or computer scientist","Pharmacist","Physician","Psychologist","Registered nurse","Science technician",
                                                          "Teacher, except postsecondary (college and university)","Teacher, postsecondary (college and university)","Therapist",
                                                          "Other health care professional","Other natural scientist","Other professional or related occupation","Other occupations"),
                             options=list(height=750,
                                          chartArea="{left:100,top:50,width:'65%',height:'85%'}",
                                          hAxis="{title:'Year',format:'####'}",
                                          vAxis="{title:'Number of Women, By Occupation'}",
                                          title="Women in Data Science"))
      graph
    })
    
    output$bubbleChart <- renderGvis({
      chart <- gvisBubbleChart(data2,idvar="Category",xvar="Not.Employed",yvar="Employed",sizevar="Total",
                               options=list(height=750,
                                            hAxis="{title:'Total Unemployed',minValue:-2500000,maxValue:9500000}",
                                            vAxis="{title:'Total Employed',minValue:-20000000}",
                                            title="Employment status of scientists and engineers, by sex, ethnicity, race, and disability status: 2013"))
      chart
    })
  }
)