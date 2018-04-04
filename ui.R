# load packages
library(shiny)
library(shinyjs)
library(shinydashboard)
library(plotly)
library(DT)
# library(xlsx)
# library(evaluate)
# library(shinycssloaders)

ui <- dashboardPage(
  # Title
  dashboardHeader(title = "VMAC Interactive EDA"),
  
  # Dashboard Sidebar
  dashboardSidebar(
    width = 250,
    sidebarMenu(
      id = "MenuTabs",
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Load Data", tabName = "loadData", icon = icon("database")),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Help", tabName = "help", icon = icon("question-circle")),
      menuItem("About", tabName = "about", icon = icon("info-circle"))
      # menuItem("Univariate Analysis", tabName = "Univariate", icon = icon("bar-chart")),
      # menuItem("Bi Variate Scatter Plot", tabName = "ScatterPlot", icon = icon("dot-circle-o")),
      # menuItem("Bi Variate Box Plot", tabName = "BoxPlot", icon = icon("sliders")),
      # menuItem("Bi Variate Group Bar Plot", tabName = "GBarPlot", icon = icon("bar-chart")),
      # menuItem("Bi Variate Group Histogram", tabName = "GHistPlot", icon = icon("area-chart")),
      # menuItem("Multi Variate Scatter Plot", tabName = "MultiScatterPlot", icon = icon("dot-circle-o")),
      # menuItem("Multi Variate Box Plot", tabName = "MultiBoxPlot", icon = icon("sliders")),
      # menuItem("EDA", tabName = "EDA", icon = icon("info-circle"))
    )
  ),
  
  # Dashboard Body
  dashboardBody(
    tabItems(
      # Home
      tabItem(
        tabName = "home",
        source("./ui_home.R", local = T)[1]
      ),
      
      # Load Data
      tabItem(
        tabName = "loadData",
        source("./ui_loadData.R", local = T)[1]
      ),
      
      # Dashboard
      tabItem(
        tabName = "dashboard",
        source("./ui_dashboard.R", local = T)[1]
      ),
      
      # Help
      tabItem(
        tabName = "help",
        source("./ui_help.R", local = T)[1]
      ),
      
      # About
      tabItem(
        tabName = "about",
        source("./ui_about.R", local = T)[1]
      )
    )
  )
)