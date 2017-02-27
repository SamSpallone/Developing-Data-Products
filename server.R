library(shiny)
shinyServer(function(input, output) {
  model1 <- lm(deaths ~ drivers, data = road)

  model1pred <- reactive({
    driversInput <- input$sliderdrivers
    predict(model1, newdata = data.frame(drivers = driversInput))
  })

  output$plot1 <- renderPlot({
    driversInput <- input$sliderdrivers
    plot(road$drivers, road$deaths, xlab = "Number of Drivers (in 10,000s)",
         ylab = "Annual Deaths", bty = "n", pch = 16,
         xlim = c(11, 952), ylim = c(43, 4743))
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
  })

  output$pred1 <- renderText({
    model1pred()
  })
})
