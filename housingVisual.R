

library(shiny)
library(ggplot2)
library(shinydashboard)
housing_data = read.csv('C:/Users/andal/OneDrive/Documents/Code/GitHub/github.io/data-science/handson-ml/datasets/housing/housing.csv')



ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(
    box(plotOutput("area_hist")),
    box(plotOutput("pop_house")),
    box(plotOutput("room_bed"))
  )
)

server <- function(input, output) {
  output$area_hist <- renderPlot({
    housing_data$ocean_proximity = as.factor(housing_data$ocean_proximity)
    levels(housing_data$ocean_proximity)
    
    ggplot(housing_data, aes(x = factor(ocean_proximity))) +
      geom_bar(stat = "count", color = "black", fill = "steelblue")
  })
  output$pop_house <- renderPlot({
    ggplot(housing_data, aes(x=population,y=households))+
      geom_point()
  })
  output$room_bed <- renderPlot({
    ggplot(housing_data, aes(x=total_rooms,y=total_bedrooms, size = ))+
      geom_point()
  })
}

shinyApp(ui, server)
