# ochoalabtools 1.0.0.9000 (2020-05-22)

* First GitHub release!  Includes `args_cli`, `fig_start`, `fig_end`, and `panel_letter` functions.

# ochoalabtools 1.0.1.9000 (2020-08-10)

* Added functions `batch_writer` and `batch_submit`, for automated job creation with `sbatch`.

# ochoalabtools 1.0.2.9000 (2020-08-12)

* Added function `batch_cleanup` to remove slurm batch scripts that have already been submitted.
* Improved function `batch_writer` defaults to write smaller files with less information by default, including no email notifications by default.

# ochoalabtools 1.0.3.9000 (2021-05-14)

* Function `batch_writer` updated call to `readr::write_lines` to use `file` instead of `path` argument, the latter of which is now deprecated (fixes deprecation warning message).

# ochoalabtools 1.0.4.9000 (2021-05-25)

* Added functions `fig_height`, `fig_width`, and `fig_scale` containing dimensions limits from some journals, and a simple scale calculator for big figures (currently just "plos" and "pnas", though checked "genetics" and "nature genetics" and found no limits specified).
  - This added `measurements` R package dependency.
  - Added tests for these functions only (other functions have no tests yet).
* Corrected documentation (all functions) to use markdown links correctly.

# ochoalabtools 1.0.5.9000 (2021-06-23)

- Reformatted this `NEWS.md` slightly to improve its automatic parsing.

# ochoalabtools 1.0.6.9000 (2021-07-18)

- Function `panel_letter` changed default value for parameter `adj` from 0 to -0.1, to match the analogous internal function in `popkin` and to have letters lay over margin area instead of over plot area.

# ochoalabtools 1.0.7.9000 (2021-11-19)

- Function `batch_writer` added `array` option for running slurm array jobs.

# ochoalabtools 1.0.8.9000 (2021-11-29)

- Function `batch_writer` added options `partition` and `account`.
- Function `batch_submit` removed `partition` option.

# ochoalabtools 1.0.9.9000 (2024-07-23)

- Function `fig_start` added options `png` and `png_res`, to output nice PNG files comparable to their PDF counterparts.
