library(shiny)
library(ggplot2)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Iris Data Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    box(plotOutput("correlation_plot")),
    box(
      selectInput("features", "Features:",
                  c("Sepal.Length", "Sepal.Width", 
                    "Petal.Length", "Petal.Width")),
    ),
    box(plotOutput("dist_plot")),
    box(plotOutput("spec_length"))
  )
)

server <- function(input, output) { 
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length, iris[[input$features]])
  })
  output$dist_plot <- renderPlot({
    ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length)) + geom_point() + theme_minimal()
  })
  output$spec_length <- renderPlot({
    boxplot(iris$Sepal.Length ~ iris$Species)
  })
  }



shinyApp(ui, server)



