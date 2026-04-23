# Export heatmap analysis results

Writes the scaled expression matrix, per-gene module assignments, and
per-module gene lists to tab-separated files in the output directory.

## Usage

``` r
export_results(mat_scaled, module_df, output_dir)
```

## Arguments

- mat_scaled:

  A scaled genes x samples matrix.

- module_df:

  A data frame containing gene-to-module assignments.

- output_dir:

  Directory where output files will be written.

## Value

Invisible NULL. Files are written to disk.

## Examples

``` r
if (FALSE) { # \dontrun{
data("example_se", package = "ADS8192")
result <- run_heatmap_analysis(example_se)
export_results(result$scaled_matrix, result$gene_modules, tempdir())
} # }
```
