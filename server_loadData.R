library(shiny)
library(shinydashboard)

output$specifyDataSource = renderUI({
  if (input$officialOrUpload == "official") {
    # show box browse
  } else if (input$officialOrUpload == "browse") {
    # show upload stuff 
    # write conditional showing of output$fileType, output$fileInput, output$inputValidation, output$selectSheet
  }
})

output$fileType = renderUI({
  radioButtons(
    inputId = "fileType",
    "Select file type",
    choices = c(Excel = "excel", CSV = "csv", `R Data File (RDA)` = "rda"),
    inline = TRUE
  )
})

output$fileInput = renderUI({
  fileTypeString <- switch(input$fileType, 
                           excel = c(".xls", ".xlsx"), csv = ".csv", rda = ".rda"
                           )
  fileInput(
    inputId = "datafile", 
    label = "Choose a file", 
    accept = c(fileTypeString)
  )
})

output$inputValidation = renderText({
  inFile = input$fileType
  if (is.null(inFile)) {
    return()
  } else {
    HTML(validateInput())
  }
})

output$selectSheet = renderUI({
  if (!is.null(xlsx::fileSheets())){
    radioButtons(
      inputId = "sheetName", 
      label = "Select sheet name", 
      choices = c(xlsx::fileSheets()),
      inline = TRUE
    )
  }
})

output$inputValidation = renderText({
  inFile = input$fileType
  if (is.null(inFile)) {
    return()
  } else {
    HTML(validateInput())
  }
})

## reactive variables

validateInput = eventReactive(input$buttonSubmit, {
  valIn = ""
  if (input$fileType == "excel") {
    validate(need(input$datafile, "Select a file"))
    validate(need(
      file_ext(input$datafile$name) %in% c("xls", "xlsx"),
      'Wrong file type. Please select an xls or xlsx file.'
    ))
  } else if (input$fileType == "csv") {
    validate(need(input$datafile, "Select a file"))
    validate(need(
      file_ext(input$datafile$name) %in% c("csv"),
      'Wrong file type. Please select a csv file.'
    ))
  } else if (input$fileType == "rda") {
    validate(need(input$datafile, "Select a file"))
    validate(need(
      file_ext(input$datafile$name) %in% c("rda"),
      'Wrong file type. Please select an rda file.'
    ))
  }
  return(valIn)
})

output$valFlag <- reactive({
  return(!is.null(validateInput()))
})
outputOptions(output, 'valFlag', suspendWhenHidden = FALSE)

fileSheets = reactive({
  inFile = input$datafile
  if (is.null(inFile)) {
    return()
  } else if (input$fileType == "excel") {
    validate(need(input$datafile, message = FALSE))
    validate(need(file_ext(inFile$name) %in% c("xlsx") , message = FALSE))
    inputbook = loadWorkbook(inFile$datapath)
    sheetnames = names(getSheets(inputbook))
    return(sheetnames)
  }
})

uploadData = reactiveValues()

observeEvent(input$buttonSubmit, {
  if (validateInput() == "") {
    if (input$fileType == "excel" & !is.null(input$sheetName)) {
      validate(need(input$datafile, message = FALSE))
      validate(need(file_ext(input$datafile$name) %in% c("xls", "xlsx"), message = FALSE))
      uploadData$fiData = read.xlsx2(input$datafile$datapath, sheetName = input$sheetName, header = input$header, stringsAsFactors = FALSE)
    } else if (input$fileType == "csv") {
      validate(need(input$datafile, "Select a File"))
      validate(need(file_ext(input$datafile$name) %in% c("csv"), message = 'Wrong file type. Please select a csv file.'))
      uploadData$fiData = read.csv(input$datafile$datapath, header = input$header, sep = input$sep, stringsAsFactors = FALSE)
      
    } else if (input$fileType == "rda") {
      validate(need(input$datafile, "Select a File"))
      validate(need(file_ext(input$datafile$name) %in% c("rda"), message = 'Wrong file type. Please select an rda file.'))
      dsName = load(input$datafile$datapath)
      uploadData$fiData = get(dsName)
    }
  }
  # return(uploadData$fiData)
})