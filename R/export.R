export_results <- function(mat_scaled, module_df, output_dir) {

  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

  # scaled expression
  scaled_out <- as.data.frame(mat_scaled)
  scaled_out$gene <- rownames(mat_scaled)

  utils::write.table(
    scaled_out,
    file.path(output_dir, "scaled_expression.tsv"),
    sep = "\t",
    row.names = FALSE,
    quote = FALSE
  )

  # gene modules
  utils::write.table(
    module_df,
    file.path(output_dir, "gene_modules.tsv"),
    sep = "\t",
    row.names = FALSE,
    quote = FALSE
  )

  # module gene lists
  module_gene_list <- do.call(rbind, lapply(unique(module_df$module), function(m) {
    genes <- module_df$gene[module_df$module == m]
    data.frame(
      module = m,
      n_genes = length(genes),
      genes = paste(genes, collapse = ","),
      stringsAsFactors = FALSE
    )
  }))

  utils::write.table(
    module_gene_list,
    file.path(output_dir, "module_gene_lists.tsv"),
    sep = "\t",
    row.names = FALSE,
    quote = FALSE
  )
}
