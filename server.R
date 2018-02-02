#rm(list=ls())
options(repos = c(CRAN = "https://cran.rstudio.com/")) 
source("helpers.R")
data(HEAT)

options(shiny.sanitize.errors = FALSE)

# GEV
#HEAT Summer maximum (and minimum) temperature at Phoenix Sky 
#Harbor airport
fit1 <- fevd(Tmax, HEAT, units="deg F")
#plot(fit1)
#plot(fit1, "trace")
#return.level(fit1)
return.level(fit1, do.ci=TRUE)
input=25
shinyServer(function(input,output) {
    output$rp = renderPrint({
      
      # build data frame
      newRP <- input$RP_Year
      RPnew <- return.level(fit1,return.period = c(newRP),do.ci=TRUE)
      RPnew
    })
    
})
