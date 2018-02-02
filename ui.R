# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
# library(rsconnect)
# deployApp()
# APP URL: https://voitel.shinyapps.io/shiny_app/
options(shiny.sanitize.errors = FALSE)
source("helpers.R")


ui<-shinyUI(fluidPage(
  # Application title
  titlePanel("Return Periods for Summer maximum temperatures in Phoenix"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("RP_Year", "Return Period Year:", min = 25, max = 500, value = 25, step = 25),
      submitButton("Calculate Return Period temperature")
    ),
      mainPanel(
               p("The purpose of this Shiny app is to calculate the return level temperature for summer high temperatures
                  in Phoenix. The calculations are based on the the HEAT dataset in the R extRemes package. 
                  The dataset includes the Summer maximum (and minimum) temperature at Phoenix Sky Harbor airport.
                  There are 43 years of data in this dataset (1948 to 1990)."),
                 p("The slider allows you to calculate a return period year of your choosing using this dataset.
                   This is calculated using extreme value theory methods, particularly using the general extreme value
                   fitting methods. You can calculate everything from a 1 year return period, to a 
                   500 year return period."),
                 p("As a note,these values are calculated only using 43 years of data, so the longer the return period year, the less
                    reliable the calculation is. For more information on extreme value theory see the book 
                    An Introduction to Statistical Modeling of Extreme Values by Stuart Coles (2001)"),
               p("The temperature return level is"),
               p(verbatimTextOutput("rp"))
               )

  )
)
)


