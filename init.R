libraries_to_install <- c("tidyverse", "plotly", "lubridate", "ggplot2", "priceR")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}
invisible(sapply(libraries_to_install, install_if_missing))





