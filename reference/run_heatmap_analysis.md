# Run the full heatmap analysis pipeline

Run the full heatmap analysis pipeline

## Usage

``` r
run_heatmap_analysis(
  se,
  n_top = 500,
  scale_method = "zscore",
  gene_k = 5,
  column_split_by = "strain",
  output_dir = NULL
)
```

## Arguments

- se:

  A SummarizedExperiment object.

- n_top:

  Number of top variable genes to keep.

- scale_method:

  Scaling method: "zscore", "minmax", or "none".

- gene_k:

  Number of row k-means clusters.

- column_split_by:

  Metadata column used for sample splitting.

- output_dir:

  Optional output directory for TSV outputs.

## Value

A list containing the heatmap, scaled matrix, and gene module
assignments.
