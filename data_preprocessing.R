# Sampling based on appliance count
library(dplyr)

sampled_df <- data.frame()
counties <- unique(all_data$county)

for (county in counties) {
  county_data <- filter(all_data, county == !!county)
  mean_appliance <- mean(county_data$appliance_count, na.rm = TRUE)
  
  sampled <- county_data %>%
    filter(abs(appliance_count - mean_appliance) < 3)
  
  sampled_df <- rbind(sampled_df, sampled)
}
