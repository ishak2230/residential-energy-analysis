# Load static house data
static_house <- read_parquet("static_house_info.parquet")

# Convert character to factor
static_house <- static_house %>%
  mutate_if(is.character, as.factor)

# Remove single-value columns
static_house <- static_house[, sapply(static_house, function(x) length(unique(x)) > 1)]

# Correlation filtering
cor_matrix <- cor(select_if(static_house, is.numeric), use = "complete.obs")
high_cor <- findCorrelation(cor_matrix, cutoff = 0.8)
static_house <- static_house[, -high_cor]

# Energy and weather retrieval loop
building_ids <- unique(static_house$building_id)
all_data <- data.frame()

for (id in building_ids) {
  energy_url <- paste0("https://intro-datascience.s3.us-east-2.amazonaws.com/SC-data/2023-houseData/", id, ".parquet")
  weather_url <- "https://intro-datascience.s3.us-east-2.amazonaws.com/SCdata/weather/2023-weather-data/"
  
  energy_data <- read_parquet(energy_url)
  weather_data <- read_parquet(weather_url)
  
  # Ensure EST/EDT time match
  energy_data$time <- with_tz(energy_data$time, tzone = "America/New_York")
  
  merged <- merge(energy_data, weather_data, by = "time")
  all_data <- rbind(all_data, merged)
}
