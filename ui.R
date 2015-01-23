library(shiny)
# shinyUI(pageWithSidebar(
shinyUI(fluidPage(
  headerPanel("BMI and BMR Calculator"),
  sidebarPanel(
    sliderInput('age', ' Age',value = 0, min = 0, max = 100, step = 1,),
    radioButtons('sex', 'Gender', c("Male","Female"),selected = NULL, inline = TRUE),
    numericInput('weight', 'Weight in Kgs ', 0,),
    numericInput('height', 'height in cms ', 0,),
    actionButton("go", "Calculate!")
   ),
  
  mainPanel(
    h4('You Entered'),
    h6('Age'),
    verbatimTextOutput("oage"),
    h6('Gender'),
    verbatimTextOutput("osex"),
    h6('Weight in kgs'),
    verbatimTextOutput("oweight"),
    h6('Height in cms'),
    verbatimTextOutput("oheight"),
    h2('Results'),
    h3('BMI'),
    verbatimTextOutput("bmi"),
    h3('BMR'),
    verbatimTextOutput("bmr")
  )
))
