#if("shiny" %in% rownames(installed.packages()) == FALSE) {install.packages("shiny")}
#if("googleVis" %in% rownames(installed.packages()) == FALSE) {install.packages("googleVis")}

library(shiny)
library(googleVis)

shinyServer(
  function(input,output) {
  
    data1 <- read.csv("tab9-2.csv")
    data1.t <- t(data1)
    colnames(data1.t) = data1.t[1,]
    data1.t.2 <- as.data.frame(data1.t[2:11,],stringsAsFactors=FALSE)
  
    data2 <- read.csv("tab9-9.1.csv",header=TRUE,stringsAsFactors=FALSE)
    
    output$dashboard <- renderGvis({
      year <- as.numeric(c("2004","2005","2006","2007","2008","2009","2010","2011","2012","2013"))
      data1.t.2 <- cbind(year,data1.t.2)
      data1.t.2[,2:20] <- lapply(data1.t.2[,2:20],function(data1.t.2){as.numeric(gsub(",", "", data1.t.2))})
      
      chart <- gvisBubbleChart(data2,idvar="Category",xvar="Employed",yvar="Not.Employed",sizevar="Total",colorvar="Series",
                               options=list(width=1800, height=800,
                                            titlePosition="out",
                                            chartArea="{width:'90%',height:'80%', legend: {position: 'in'}}",
                                            sizeAxis='{minSize: 20, maxSize: 150}',
                                            colorAxis="{minValue: 0, colors: ['#490A3D','#BD1550','#E97F02','#F8CA00','#8A9B0F']}",
                                            legend="{position:'in', textStyle:{color: 'black', fontName: 'Calibri'}}",
                                            hAxis="{title:'Total Employed',minValue:-5000000, textStyle:{color: 'black', fontName: 'Calibri'}}", #,maxValue:9000000
                                            vAxis="{title:'Total Unemployed',minValue:-500000, textStyle:{color: 'black', fontName: 'Calibri'}}",
                                            axisTitlesPosition="out",
                                            title="Employment status of scientists and engineers, by sex, ethnicity, race, and disability status: 2013",
                                            titleTextStyle="{color:'#490A3D', fontName:'calibri', fontSize:40}",
                                            bubble="{
                                              textStyle:{
                                                color: 'black', fontName: 'Calibri'},
                                              opacity:'0.3'}",
                                            explorer="{actions: ['dragToZoom','rightClickToReset'],maxZoomIn:0.05}"))
      
      output <- chart
      
      output
    })
    

  }
)