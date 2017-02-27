library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Number of Annual Deaths from Number of Drivers"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderdrivers", "What is the number of drivers (in 10,000s)?", 11, 952, value = 11),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted number of annual deaths from Model 1:"),
      textOutput("pred1")
    )
  )
))
