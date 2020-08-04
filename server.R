# Define server logic required to draw a histogram ----
server <- function(input, output) {

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlotly({

    currency <- input$currency
    start_year <- input$start_year 
    end_year <- input$end_year 
    
    

   # Read the data
    dat <- readRDS("dat.RDS")
    
    # Generate plot
    
    start_date <- start_year %>% as.numeric
    end_date <- end_year %>% as.numeric
    len_years <- (end_date - start_date) + 1
    
    currency_col_name <- currency %>% tolower %>% paste0("aud_to_", .)
    currency <- sym(currency_col_name)
    
    plot <- dat %>% 
      filter(year(date) >= start_date, year(date) <= end_date) %>% 
      ggplot(aes(x = date, y = !!currency, group = 1)) +
      geom_line() +
      geom_smooth(method = 'loess') + 
      theme(axis.title.x=element_blank(),
            axis.ticks.x=element_blank()) + 
      scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
      ggtitle(paste0("AUD to USD over last ", len_years, " years"))
    
    plot
    
    plot %>% ggplotly


    })

}