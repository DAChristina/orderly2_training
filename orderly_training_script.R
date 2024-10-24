# More info:
# https://mrc-ide.github.io/orderly2/articles/introduction.html



install.packages(
  "orderly2",
  repos = c("https://mrc-ide.r-universe.dev", "https://cloud.r-project.org"))

install.packages(
  c("gert", "jsonvalidate"),
  repos = c("https://ropensci.r-universe.dev", "https://cloud.r-project.org"))

path <- tempfile() # we'll use a temporary directory here - see note below
orderly2::orderly_init(path)

# Why???? To conduct some sort of collaborative session???
setwd(path)


# Load the data:
d <- read.csv("data.csv")
d$z <- resid(lm(y ~ x, d))
saveRDS(d, "data.rds")

# Feels like Rmarkdown but how to generate collaborations???
id <- orderly2::orderly_run("incoming_data")
## ℹ Starting packet 'incoming_data' `20241024-100052-9f71167c` at 2024-10-24 10:00:52.629131
## > d <- read.csv("data.csv")
## > d$z <- resid(lm(y ~ x, d))
## > saveRDS(d, "data.rds")
## ✔ Finished running incoming_data.R
## ℹ Finished 20241024-100052-9f71167c at 2024-10-24 10:00:52.692871 (0.0637393 secs)
id
## [1] "20241024-100052-9f71167c"


dest <- tempfile()
fs::dir_create(dest)
orderly2::orderly_copy_files(id, files = c("final.rds" = "data.rds"),
                             dest = dest)

