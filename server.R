# load packages
library(tools)
library(dplyr)
library(tidyr)
library(stringr)
library(plotly)
library(DT)
library(Hmisc)
library(rms)

# options
options(shiny.maxRequestSize = 200*1024^2) # upload larger files
rm(list = ls())

shinyServer(function(input, output, session) {
  options(warn = -1)
  # source("./server_loadData.R", local = T)
  # source("./server_dashboard.R", local = T)
  # source("./server_help.R", local = T)
  # source("./server_about.R", local = T)
})
