library(shiny)
library(car)    # Recode() function required in this app for numeric transformation.

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    # Calculate the interest and amount    
    observe({
        input$action_reckoner
        values$int <- isolate({
            input$initial_principal * input$slider_interestRate *
                recode(input$select_periods, "1 = '1'; 2 = '0.25'; 
                                   3 = '0.08333333'")/100 * input$slider_numberOfPayments  
        })
        values$amt <- isolate(input$initial_principal) + values$int
    })

    # Display values entered
    output$text_principal <- renderText({
        input$action_reckoner
        paste("Initial Loan in Australian Dollars:", isolate(input$initial_principal))
    })
    
    output$text_interestRate <- renderText({
        input$action_reckoner
        paste("Interest rate: ", isolate(input$slider_interestRate), 
              " % per year")
    })
        
    output$text_num <- renderText({
        input$action_reckoner
        paste("Number of Repayment Periods: ", isolate(input$slider_numberOfPayments),
              recode(isolate(input$select_periods),
                     "1 = 'Years'; 2 = 'Quarters';3 = 'Months'")
              )
    })
    
    # Display computed results
    
    output$text_int <- renderText({
        if(input$action_reckoner == 0) ""
        else
            paste("Interest Payable in Australian dollars:", round(values$int))
    })
    
     output$text_amt <- renderText({
        if(input$action_reckoner == 0) ""
        else 
            paste("Total Liability (Principal and Interest) in Australian dollars:", values$amt)
    })

})