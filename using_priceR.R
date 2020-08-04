

# 
# # Retieve AUD to USD exchange rates
# au <- historical_exchange_rates("AUD", to = "USD",
#                           start_date = "2010-01-01", end_date = "2020-06-30")
# 
# # Retieve AUD to EUR exchange rates
# ae <- historical_exchange_rates("AUD", to = "EUR",
#                           start_date = "2010-01-01", end_date = "2020-06-30")
# 
# # Combine
# cur <- au %>% left_join(ae, by = "date")
# 
# ap <- historical_exchange_rates("AUD", to = "GBP",
#                           start_date = "2010-01-01", end_date = "2020-06-30")
# 
# cur <- cur %>% left_join(ap, by = "date")
# 
# 
# 
# # Join and rename data
# dat <- cur %>%
#   rename(aud_to_usd = one_AUD_equivalent_to_x_USD,
#          aud_to_eur = one_AUD_equivalent_to_x_EUR,
#          aud_to_gpd = one_AUD_equivalent_to_x_GBP) %>%  
#   mutate(date = as.Date(date)) 
# 
# 
# # setwd("/Users/st/R/forex-shiny")
# 
# # Write the data
# saveRDS(dat, "dat.RDS")




library(plotly)
library(ggplot2)
library(tidyverse)
library(lubridate)

# Read the data
dat <- readRDS("dat.RDS")



# Generate plot

all_years <- dat$date %>% year %>% unique


start_date <- first(all_years)
end_date <- last(all_years)
len_days <- end_date - start_date
currency <- sym("aud_to_usd")

plot <- dat %>% 
  filter(year(date) >= start_date, year(date) <= end_date) %>% 
  ggplot(aes(x = date, y = !!currency, group = 1)) +
  geom_line() +
  geom_smooth(method = 'loess') + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x=element_blank()) + 
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  ggtitle(paste0("AUD to USD over last ", len_days, " days"))


plot %>% ggplotly














