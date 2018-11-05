library(shiny)
library(tidyverse)

x <- read_rds("floridaprimarydata.rds")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Florida Democratic Primary 2018"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Input: Numeric entry for number of obs to view ----
      selectInput(inputId = "dataset",
                  label = "Choose a Florida county:",
                  choices = c("Alachua", "Baker", "Bay", "Bradford", "Brevard", "Broward", 
                             "Calhoun", "Charlotte", "Citrus", "Clay", "Collier", "Columbia", 
                             "Miami-Dade", "Desoto", "Dixie", "Duval", "Escambia", "Flagler", 
                             "Franklin", "Gadsden", "Gilchrist", "Glades", "Gulf", "Hamilton",
                             "Hardee", "Hendry", "Hernando", "Highlands", "Hillsborough", "Holmes",
                             "Indian River", "Jackson", "Jefferson", "Lafayette", "Lake", "Lee",
                             "Leon", "Levy", "Liberty", "Madison", "Manatee", "Monroe", "Marion",
                             "Martin", "Nassau", "Okaloosa", "Okeechobee", "Orange", "Osceola",
                             "Palm Beach", "Pasco", "Pinellas", "Polk", "Putnam", "Santa Rosa",
                             "Sarasota", "Seminole", "St. Johns", "St. Lucie", "Sumter", "Suwannee",
                             "Taylor", "Union", "Volusia", "Wakulla", "Walton", "Washington"))),
      
    
    # Show a plot of the generated distribution
    mainPanel(
      
      plotOutput("view")
      
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$view <- renderPlot({
  }
  x %>% 
    filter(CountyName == input$CountyName) %>% 
    ggplot(aes(x = percent, y = value)) + 
    geom_bar(stat='identity') + 
    xlab("Candidate") + ylab("Percent")
  )
  
}

# Run the application 
shinyApp(ui = ui, server = server)
