#Diego
# Diego
#install.packages("shiny")
#install.packages("ggplot2")
library(shiny)
library(ggplot2)

# It defines the user interface, the HTML webpage that humans interact with. 

ui <- fluidPage(
    tags$h3("Diego"),
    selectInput(inputId = "x", label = "X Axis", choices = names(mtcars), selected = "mpg"),
    selectInput(inputId = "y", label = "Y Axis", choices = names(mtcars), selected = "hp"),
    plotOutput(outputId = "scatterPlot")
  )


# It specifies the behavior of our app by defining a server function.

server <- function(input, output){
    data <- reactive({mtcars})
    output$scatterPlot <- renderPlot({
    ggplot(data = data(), aes_string(x = input$x)) + 
    geom_density(fill = "#8800ff", size =0.5) + 
    theme_classic()
    
  })
  
}

# Construct and start a Shiny application from UI and server.

shinyApp(ui = ui, server = server)