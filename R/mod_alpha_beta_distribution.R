#' alpha_beta_category_distribution UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_alpha_beta_category_distribution_ui <- function(id){
  ns <- NS(id)
  tagList(

    plotOutput(outputId = ns("distribution_plot"))

    )
}

#' alpha_beta_category_distribution Server Functions
#'
#' @noRd
mod_alpha_beta_category_distribution_server <- function(id, data_filtered){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$distribution_plot <- renderPlot(
      data_filtered() %>%
        ImmunoCleaner::alpha_beta_category_distribution(),
      res = 125
    )

  })
}

## To be copied in the UI
# mod_alpha_beta_category_distribution_ui("alpha_beta_category_distribution_1")

## To be copied in the server
# mod_alpha_beta_category_distribution_server("alpha_beta_category_distribution_1")
