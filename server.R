library(shiny)
bmi<-function(weight,height){weight/((height/100)^2)}
bmrmale<-function(weight,height,age,sex)
{
  a = 13.397*weight + 4.799*height - 5.677*age + 88.362
  a
}
bmrfemale<-function(weight,height,age,sex)
{
  a =9.247*weight+ 3.098*height- 4.330*age + 447.593
  a
}
shinyServer(
  function(input, output) {
    output$oage <- renderPrint({input$age})
    output$osex <- renderPrint({input$sex})
    output$oweight<- renderPrint({input$weight})
    output$oheight<- renderPrint({input$height})
    output$bmi <- renderPrint({
    if (input$go != 0){ bmi(input$weight,input$height )
    }
    else "Press Calculate"
    })
    output$bmr <- reactive({
      if (input$go != 0){
      
        
        if(input$sex =="Female"){
          bmrfemale(input$weight,input$height,input$age,input$sex)
        }
        else if (input$sex == "Male"){
          bmrmale(input$weight,input$height,input$age,input$sex)
        }
      }
      else "Press calculate"
    })
   
  }
)