fluidPage(
  fluidRow(
    column(
      width = 12, 
      align = "left",
      
      h1("VMAC Interactive IDE"),
      h2("A web app for easy exploration of VMAC datasets"),
      tags$div(
        style = 'height: 20px ;'
      ),
      
      h3("About"),
      h4("Put short about here."),
      tags$div(
        style = 'height: 5px ;'
      ),

      h3("Getting started"),
      h4("Follow these steps to use this app."),
      tags$ol(
        tags$li(
          h4("In the \"Load Data\" tab, choose a dataset to use for exploration.")
        ),
        tags$li(
          h4("...")
        ),
        tags$li(
          h4("...")
        )
      ), # end ol
      h4("Detailed instructions can be found in the \"Help\" tab."),
      tags$div(
        style = 'height: 5px ;'
      ),

      h4(
        "The source code for this app is available at",
        tags$a(
          href = "https://github.com/prettynumbers/vmac-eda",
          "https://github.com/prettynumbers/vmac-eda"
        )
      ),
      tags$div(
        style = 'height: 5px ;'
      ),
      
      h3("Contact information"),
      h4(
        "This app was created by ",
        tags$a(
          href = "mailto:omair.a.khan@vumc.org",
          "Omair A. Khan"
        ),
        "."
      ),
      h4(
        "This app is maintained by ",
        tags$a(
          href = "mailto:omair.a.khan@vumc.org",
          "Omair A. Khan"
        ),
        " under the supervision of ",
        tags$a(
          href = "mailto:dandan.liu@vumc.org",
          "Dandan Liu",
          "."
        )
      ),
      tags$div(
        style = 'height: 5px ;'
      ),
      
      align = "center",
      HTML(
        paste(
          icon("copyright"), 
          "2018, Vanderbilt University Medical Center Department of Biostatistics"
        )
      ),
      tags$div(
        style = 'height: 25px ;'
      )
    ) # end column
  ) # end fluidRow
) # end fluidPage
