mk_endpoint_def <- function() {
    ## Put your calls to mk_endpoint_str() here. For multiple endpoints, rbind several calls to mk_endpoint_str()
    rbind(
        mk_endpoint_str(
            study_metadata = list(),
            pop_var = "SAFFL",
            pop_value = "Y",
            treatment_var = "TRT01A",
            treatment_refval = "Xanomeline High Dose",
            period_var = "SAFFL",
            period_value = "Y",
            ## stratify_by = list(c("AGEGR1","SEX","RACE","ETHNIC")),
            stratify_by = list(c("AGEGR1")),
            data_prepare = mk_adsl_template,
            endpoint_label = "Demographics",
            ## endpoint_filter = "",
            ## custom_pop_filter = "TRT01A %in% c('Placebo', 'Xanomeline High Dose')",
            stat_by_strata_by_trt = list("n" = c(chefStats::n_subj),
                                         "n_subev" = c(chefStats::n_subj_event))
            ## stat_by_strata_across_trt = list("RR" = c(chefStats::RR)),
            ## stat_across_strata_across_trt = list('pvalI' = c(chefStats::p_val_interaction))
            ## ),
        ## mk_endpoint_str(
        ##     study_metadata = list(),
        ##     pop_var = "SAFFL",
        ##     pop_value = "Y",
        ##     treatment_var = "TRT01A",
        ##     treatment_refval = "Xanomeline High Dose",
        ##     period_var = "SAFFL",
        ##     period_value = "Y",
        ##     stratify_by = list(c("AGEGR2")),
        ##     data_prepare = mk_adae_template,
        ##     endpoint_label = "Any adverse events - test data - on-treatment - safety analysis set",
        ##     endpoint_filter = "!is.na(AEDECOD)",
        ##     custom_pop_filter = "TRT01A %in% c('Placebo', 'Xanomeline High Dose')",
        ##     stat_by_strata_by_trt = list("n_subev" = c(chefStats::n_subj_event)),
        ##     stat_by_strata_across_trt = list("RR" = c(chefStats::RR)),
        ##     stat_across_strata_across_trt = list('pvalI' = c(chefStats::p_val_interaction))
        )
    )
}
