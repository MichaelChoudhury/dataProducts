library(shiny)

shinyUI(fluidPage(
    titlePanel("Personal Loan: Total Interest and Principal Ready reckoner"),
    sidebarLayout(position = "right",
        sidebarPanel(
            helpText("This application assists in the creation and analysis of multiple scenarios where all the variables - interest rate, principal, term of loan, and number of payments - may all be varied."),            
            br(),            
            numericInput("initial_principal",
                         label = h6("Enter the initial Principal borrowed in Australian dollars"),
                         value = 10000),
            br(),            
            sliderInput("slider_interestRate",
                        label = h6("Enter the percentage (annualised) interest rate"),
                        min = 0, max = 25, value = 10),
                       
            br(),            
            sliderInput("slider_numberOfPayments",
                        label = h6("Select the number of intallment payments"),
                        min = 0, max = 120, value = 5),
            selectInput("select_periods",
                        label = h6(""),
                        choices = list("Number of Years" = 1,
                                       "Number of Quarters" = 2,
                                       "Number of Months" =3),
                        selected = 1
            ), 
            br(),
            br(),            
            actionButton("action_reckoner", label = "Submit")        
        ),
        mainPanel( img(src='test.png', align = "right", height=150, width=350),
			
            tabsetPanel(
                tabPanel("Computation",
                    p(h5("Your assumptions:")),
                    textOutput("text_principal"),
                    textOutput("text_intrate"),
                    textOutput("text_num"),
                    textOutput("text_time"),
                    br(),
                    p(h5("Computed Results  <please press the SUBMIT button in the panel on the right>:")),
                    textOutput("text_int"),
                    textOutput("text_amt")
                ),


                tabPanel("Help",
                    p(h4("Interest Ready Reckoner:")),
                    br(),
                    helpText("This application calculates simple interest
                             and total amount, i.e., initial principal plus interest accrued. For example, the total amount 			accrued, principal plus interest,
					from simple interest on a principal of $ 10,000.00
						at a rate of 3.875% per year
							for 5 years is $ 11,937.50."),
                    


		HTML ("Please press the SUBMIT button to refresh the page and execute the computation. ")                

                )

            )
        )
    )
))