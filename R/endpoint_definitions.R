mk_endpoint_def <- function() {
    rbind(mk_endpoint_str(
      data_prepare = mk_adae,
      treatment_var = "TRT01A",
      treatment_refval = "Xanomeline High Dose",
      pop_var = "SAFFL",
      pop_value = "Y",
      stratify_by = list(c("SEX","AGEGR","RACE")),
      stat_by_strata_by_trt = list(
        chefStats::n_subj,
        chefStats::n_subj_event,
        demo_n_events),
      stat_by_strata_across_trt = list(
        chefStats::RR,
        chefStats::OR,
        chefStats::p_val),
      endpoint_filter = "!is.na(AEDECOD)"
    ),
    mk_endpoint_str(
    data_prepare = mk_adae_low,
    treatment_var = "TRT01A",
    treatment_refval = "Xanomeline Low Dose",
    pop_var = "SAFFL",
    pop_value = "Y",
    stratify_by = list(c("SEX","AGEGR","RACE")),
    stat_by_strata_by_trt = list(
      chefStats::n_subj,
      chefStats::n_subj_event),
    stat_by_strata_across_trt = list(
      chefStats::RR,
      chefStats::OR,
      chefStats::p_val),
    endpoint_filter = "!is.na(AEDECOD)"
  )

    )
}
