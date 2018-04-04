fluidPage(
  fluidRow(
    box(
      title = "Specify a dataset", width = 4, status = "primary", solidHeader = TRUE, collapsible = TRUE,
      radioButtons(
        inputId = "officialOrUpload", 
        "Type of dataset", 
        c(`Official dataset` = "official", `Upload a file` = "upload"),
        inline = FALSE
      ),
      uiOutput(outputId = "specifyDataSource")
      # etc
    ),
    tabBox(
      title = "Data Processing", width = 8, id = "InputData",
      tabPanel("Data Structure",
               conditionalPanel("output.ValFlag", htmlOutput("dataInfo")),
               conditionalPanel("output.ValFlag", verbatimTextOutput("strData"))),
      tabPanel("Data Preview",
               conditionalPanel("output.ValFlag", DT::dataTableOutput("DataTable"))),
      tabPanel("Select Column Features",
               conditionalPanel("output.ValFlag", withSpinner(uiOutput("SelDimMeas")),
                                actionButton("btExplore", "Explore Data")))
    )
  ) # end fluidRow
) # end fluidPage