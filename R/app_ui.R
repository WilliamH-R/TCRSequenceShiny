#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),

    # Your application UI logic
    fluidPage(

      # App title
      titlePanel("ImmunoViz"),

      #
      sidebarLayout(
        sidebarPanel(
          verticalLayout(
            title = h4("Choose data set and settings"),
            mod_filter_data_set_ui("filter_data_set_1"),
            hr(),
            mod_show_percentage_left_ui("show_percentage_left_1"),
            hr(),
            h4("Download data with the filters applied from above"),
            mod_download_ui("download_1")
          )),

      mainPanel(
        tabsetPanel(
          tabPanel(title = "Descriptive Statistics",
                   h3("Show distribution of relevant binders grouped by user
                      selection to compare with and without filtering"),
                   mod_summarise_data_ui("summarise_data_1"),
                   hr(),
                   mod_boxplot_protein_expression_ui("boxplot_protein_expression_1")
                   ),
          tabPanel(title = "Data Check",
                   h3("Check distributions of the loaded data set"),
                   mod_alpha_beta_sequence_distinctiveness_ui("alpha_beta_sequence_distinctiveness_1"),
                   hr(),
                   mod_alpha_beta_category_distribution_ui("alpha_beta_category_distribution_1"),
                   hr(),
                   mod_plot_count_pr_allele_ui("plot_count_pr_allele_1")
                   ),
          tabPanel(title = "Data Exploration",
                   br(),
                   h3("Check binding events between pMHC and non-promiscuous
                      TCR-sequences"),
                   mod_plot_relevant_binders_plot_ui("plot_relevant_binders_plot_1"),
                   h3("Umap of all protein expression levels"),
                   mod_plot_umap_ui("plot_umap_1")
                   ),
          tabPanel(title = "README",
                   mod_readme_ui("readme_1")
                   )
          )
        )

      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "ImmunoViz"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
