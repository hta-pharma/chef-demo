library(digest)

## Facilitate fetching SDTM data from: https://github.com/cdisc-org/sdtm-adam-pilot-project/blob/master/updated-pilot-submission-package/900172/m5/datasets/cdiscpilot01/analysis/adam/datasets/

## Where to store ADAM data. Create if the directory doesn't exist
data_path <- base::file.path("data")
if (!base::dir.exists(data_path)) {base::dir.create(data_path)}

sdtm_files <- c("adae.xpt",
                "adsl.xpt")
xpt_files <- base::file.path(getwd(), data_path, sdtm_files)
xpt_hashes <- c("b8678e70946473a753bb01d002917f478bf51b59bdd0dc19587b97128059b6a0",
                "c5139f873a93ef6add77bc4297beb6460a398bbdd036874382a9f39dfc92091d")

## Build a dictionary with file names and their expected hashes
expected_hash <- stats::setNames(xpt_hashes, xpt_files)

## Get the file hashes
file_hashes <- base::mapply(function(path) {
    base::tryCatch({
        digest::digest(path, algo = "sha256", file = TRUE)
    },
    error = function(cond) {
        base::print(base::paste0(base::basename(path), "does not seem to exist. Downloading it now."))
        utils::download.file(base::paste0("https://github.com/cdisc-org/sdtm-adam-pilot-project/raw/master/updated-pilot-submission-package/900172/m5/datasets/cdiscpilot01/analysis/adam/datasets/", basename(path)), path)
        digest::digest(path, algo = "sha256", file = TRUE)
    })}, xpt_files )

## Check if hashes are correct for all files.
for (name in names(expected_hash)) {
    # If file doesn't exist locally, download it.
    if (!(name %in% names(file_hashes))) {
        base::print(base::paste0(base::basename(name), "is missing. Downloading it now."))
        utils::download.file(base::paste0("https://github.com/cdisc-org/sdtm-adam-pilot-project/raw/master/updated-pilot-submission-package/900172/m5/datasets/cdiscpilot01/analysis/adam/datasets/", basename(name)), name)
    }
    else if (!(expected_hash[name] == file_hashes[name])) {
        base::print(base::paste0(name, " has a hash error. Downloading it again.")) }
    else {
        base::print(base::paste0(base::basename(name), " looks good. You can run the example."))
        }
}
