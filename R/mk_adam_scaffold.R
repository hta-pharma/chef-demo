mk_adae_template <- function(study_metadata){
    adae <- data.table::as.data.table(haven::read_xpt("data/adae.xpt"))
    adsl <- data.table::as.data.table(haven::read_xpt("data/adsl.xpt"))

    ## Make a subgroup:
    adsl[, AGEGR2 := data.table::fcase(AGE < 65, "AGE < 65",
                                       AGE >= 65, "AGE >= 65",
                                       default = NA)]
    
    ## Merge adsl and adae
    adae_out <- merge(adsl, adae[, c(setdiff(names(adae), names(adsl)), "USUBJID"), with =
                                                                                F], by = "USUBJID", all = TRUE)
}
