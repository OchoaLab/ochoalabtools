# 2020-05-22 - ochoalabtools 1.0.0.9000

* First GitHub release!  Includes `args_cli`, `fig_start`, `fig_end`, and `panel_letter` functions.

# 2020-08-10 - ochoalabtools 1.0.1.9000

* Added functions `batch_writer` and `batch_submit`, for automated job creation with `sbatch`.

# 2020-08-12 - ochoalabtools 1.0.2.9000

* Added function `batch_cleanup` to remove slurm batch scripts that have already been submitted.
* Improved function `batch_writer` defaults to write smaller files with less information by default, including no email notifications by default.
