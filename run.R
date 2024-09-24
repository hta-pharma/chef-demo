## When you are starting up your R-sessions and want to continue your work

library(chef)

## Select the pipeline targets is working on
chef::stage_pipeline("cdisc_pilot")

## Run the pipeline
tar_make()

## Load results
tar_load(ep_stat)
