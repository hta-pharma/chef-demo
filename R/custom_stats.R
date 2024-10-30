# Custom function to count number of events
demo_n_events <-
  function(dat,
           event_index,
           cell_index,
           subjectid_var,
           ...) {
    intersect_index <- intersect(event_index, cell_index)
    stat <- dat[list(intersect_index)] |>
        NROW()
    

    return(
      data.table::data.table(
        description = "Number of events",
        qualifiers = NA_character_,
        label = "E",
        value = as.double(stat)
      )
    )
  }
