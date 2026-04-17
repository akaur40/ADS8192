run_heatmap_analysis <- function(se,
                                 n_top = 500,
                                 scale_method = "zscore",
                                 gene_k = 5,
                                 column_split_by = "strain",
                                 output_dir = NULL) {

  # Step 1: normalize counts
  mat_norm <- normalize_counts(se)

  # Step 2: select top variable genes
  mat_top <- select_top_variable_genes(mat_norm, n_top)

  # Step 3: scale matrix
  mat_scaled <- scale_expression_matrix(mat_top, scale_method)

  # Step 4: build heatmap
  ht <- build_heatmap(mat_scaled, se, gene_k, column_split_by)

  # Step 5: extract gene modules
  module_df <- extract_gene_modules(ht, mat_scaled)

  # Step 6: export results (if output_dir is provided)
  if (!is.null(output_dir)) {
    export_results(mat_scaled, module_df, output_dir)
  }

  # return
  return(list(
    heatmap = ht,
    scaled_matrix = mat_scaled,
    gene_modules = module_df
  ))
}
