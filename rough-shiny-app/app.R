library(shiny)
library(tidyverse)
df <- readRDS('floridaprimary.rds')

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     
      sidebarPanel(
        
         selectInput(inputId = "dataset",
                     label = "Select County in Florida",
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
                                 "Taylor", "Union", "Volusia", "Wakulla", "Walton", "Washington")
      )
   )
)
)

# Define server function required to create the pie chart
server <- function(input, output) {
  
  # Create pie chart object the plotOutput function is expecting
  output$view <- renderTable({
    barplot()
  })
}


# Run the application 
shinyApp(ui = ui, server = server)

