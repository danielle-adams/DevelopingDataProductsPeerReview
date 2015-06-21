library(shiny)

shinyUI(
        navbarPage("USArrests Dataset",
                   tabPanel("Detail",
                            h2("Violent Crime Rates by US State"),
                            hr(),
                            h3("Description"),
                            helpText("This data set contains statistics, in arrests per 100,000 residents for assault,", 
                                     "murder, and rape in each of the 50 US states in 1973. ",
                                     " Also given is the percent of the population living in urban areas."),
                            h3("Format"),
                            p("A data frame with 50 observations on 4 variables."),
                            
                            p("  [, 1]   State           State Name"),
                            p("  [, 2]   Murder          Murder arrests (per 100,000)"),
                            p("  [, 4]	 Assault	 Assault arrests (per 100,000)"),
                            p("  [, 5]	 UrbanPop	 Percentage urban population"),
                            p("  [, 6]	 Rape	         Rape arrests"),
                            
                            h3("Source"),
                            
                            p("World Almanac and Book of facts 1975. (Crime rates)."),
                            p("Statistical Abstracts of the United States 1975. (Urban rates).")
                   ),
                            
                   tabPanel("Analysis",
                            fluidPage(
                                    titlePanel("The crime rate in different states in 1975"),
                                    sidebarLayout(
                                            sidebarPanel(
                                                    selectInput("variable", h3("Type of crime:"),
                                                                c("Murder Rate" = "Murder",
                                                                  "Assault Rate" = "Assault",
                                                                  "Rape Rate" = "Rape"
                                                                )),
                                                    sliderInput("slide", label = h3("How many states to show :"),
                                                                min = 5, max = 50, value = 20)
                                                    
                                            ),
                                            
                                            mainPanel(                                                    
                                                    tabsetPanel(type = "tabs", 
                                                                tabPanel("Rating Plot", plotOutput("crimeRatePlot")),
                                                                tabPanel("Distribution", plotOutput("crimeMap"))
                                                                )
                                                    )
                                            )
                                    )
                   ),
                   
                   tabPanel("SourceCode",
                            p("Shiny App and the Presentation"),
                            a("https://github.com/danielle-adams/DevelopingDataProductsPeerReview")
                   ),
                   
                   tabPanel("Documents",
                            p("The presentation is on github"),
                            a("https://github.com/danielle-adams/DevelopingDataProductsPeerReview/Slidify/index.html"),
                            hr(),
                            h3("Inputs"),
                            p("This is a ranking system of crime rates. 
                              Users are required to choose the crime type and 
                              how many states to show in the plot. "),
                            p("For example, the default inputs are **Murder Rate** and **20**. 
                              Thus, by default, the bar plot shows 20 states with the highest murder rate. 
                              The state with the highest murder rate, **Georgia**, will be ranked first. "),
                            br(),
                            h3("Raking the Crime Rate: Bar Plot"),
                            p("In this part, a bar plot about will be created due to the crime type from the selectInput. 
                                And the number from the sliderInput defines how many state to plot. 
                              The plot is a ranking of a certain crime rate in severl states."),
                            br(),
                            h3("Showing the Crime Rate: Map"),
                            p("According to the USArrests data, a map will be created to show 
                                the distribution of a certain type of crime in 48 states. 
                              Darker color represents higher crime rate. ")
                )
        )
)