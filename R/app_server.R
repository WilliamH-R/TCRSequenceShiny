#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#'
#' @importFrom magrittr %>%
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  data_filtered <- mod_filter_data_set_server("filter_data_set_1")[[1]]
  data_sets <- mod_filter_data_set_server("filter_data_set_1")[[2]]
  HLA_typings <- mod_filter_data_set_server("filter_data_set_1")[[3]]
  additional_filters = mod_filter_data_set_server("filter_data_set_1")[[4]]
  UMI_count_min = mod_filter_data_set_server("filter_data_set_1")[[5]]
  negative_control_UMI_count_min = mod_filter_data_set_server("filter_data_set_1")[[6]]
  mod_show_percentage_left_server("show_percentage_left_1",
                                  data_filtered = data_filtered)
  mod_summarise_data_server("summarise_data_1",
                            data_filtered = data_filtered,
                            data_sets = data_sets)
  mod_plot_relevant_binders_plot_server("plot_relevant_binders_plot_1",
                                              data_filtered = data_filtered)
  mod_plot_umap_server("plot_umap_1",
                       data_filtered = data_filtered)
  mod_alpha_beta_category_distribution_server("alpha_beta_category_distribution_1",
                                     data_filtered = data_filtered)
  mod_alpha_beta_sequence_distinctiveness_server("alpha_beta_sequence_distinctiveness_1",
                                        data_filtered = data_filtered)
  mod_plot_count_pr_allele_server("plot_count_pr_allele_1",
                                  data_filtered = data_filtered)
  mod_boxplot_protein_expression_server("boxplot_protein_expression_1",
                                        data_filtered = data_filtered)
  mod_print_output_server("print_output_1")
  mod_download_server("download_1",
                      data_filtered = data_filtered,
                      data_sets = data_sets,
                      HLA_typings = HLA_typings,
                      additional_filters = additional_filters,
                      UMI_count_min = UMI_count_min,
                      negative_control_UMI_count_min = negative_control_UMI_count_min)
  mod_readme_server("readme_1")
}
