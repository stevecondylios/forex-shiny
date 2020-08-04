

# AUD / USD
# AUD / EUR


# From: https://stackoverflow.com/questions/28124889/how-to-fetch-3-years-historical-price-serie-from-oanda-with-r
# install.packages("quantmod")

library(quantmod)
library(tidyverse)

getFX("AUD/USD",from="2005-01-01")


symbols <- c(
  "UUP",
  "FXB",
  "FXE",
  "FXF",
  "FXY",
  "SLV",
  "GLD"
)

getSymbols(symbols, from="2004-01-01")

prices <- list()
for(i in 1:length(symbols)) {
  prices[[i]] <- Cl(get(symbols[i]))  
}

aud <- do.call(rbind, lapply(0:2, function(i) {
  getFX("AUD/USD", 
        from = Sys.Date() - 499 * (i + 1),
        to = Sys.Date() - 499 * i,
        env=NULL)
}))

prices <- do.call(cbind, c(prices, list(aud)))



prices %>%
  as.data.frame %>% 
  tibble::rownames_to_column("dates") %>% 
  select(dates, AUD.USD) %>% 
  ggplot(aes(x = dates, y = AUD.USD)) +
  geom_smooth()






