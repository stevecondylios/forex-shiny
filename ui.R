library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)
library(lubridate)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("Hello Shiny!"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      selectInput(inputId = "start_year",
                  label = "Start Year:",
                  choices =  c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
                  selected = 2010), 
      
      selectInput(inputId = "end_year",
                  label = "End Year:",
                  choices =  c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
                  selected = 2020), 
      
            selectInput(inputId = "currency",
                  label = "Currency",
                  choices = c("USD", "EUR", "GPD"))

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotlyOutput(outputId = "distPlot")

    )
  )
)