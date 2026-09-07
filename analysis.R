# Load required packages for data manipulation and visualization
library(tidyverse)

# Import the dataset containing student information
data <- read_csv("data/ai_student.csv")

# Check the names of the variables to ensure correct import
names(data)

# Display the structure of the dataset
# (number of observations, variables, and data types)
glimpse(data)

# Data preparation

# Create a working dataset for the analysis
# (the original dataset 'data' is kept unchanged)
data_analysis <- data %>%
  
# Keep only the variables relevant for the analysis
  select(
    final_score,
    uses_ai,
    ai_usage_time_minutes,
    study_hours_per_day,
    class_participation_score,
    concept_understanding_score
  ) %>%
  
# Remove observations with missing values
# to ensure clean statistics and graphs
  drop_na() %>%
  
# Make the AI usage variable more readable for graphs
# (convert 0/1 into text labels)
  mutate(
    uses_ai = ifelse(uses_ai == 1, "Uses AI", "Does not use AI")
  )


# Graph 1: Distribution of final_score

# Histogram with improved readability
p1 <- ggplot(data_analysis, aes(x = final_score)) +
  geom_histogram(
    bins = 30,
    fill = "lightblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Final Academic Scores",
    x = "Final score",
    y = "Number of students"
  ) +
  theme_minimal()

# Display the plot
p1


# Save Graph 1

# Save the first figure for the report
ggsave(
  filename = "figure1_distribution_final_score.png",
  plot = p1,
  width = 7,
  height = 4,
  dpi = 300
)


# Graph 2: Final score by AI usage

# Create a boxplot comparing final scores by AI usage
p2 <- ggplot(data_analysis, aes(x = uses_ai, y = final_score)) +
  geom_boxplot() +
  labs(
    title = "Final Academic Score by AI Tool Usage",
    x = "AI tool usage",
    y = "Final score"
  ) +
  theme_minimal()

# Display the plot
p2


# Save Graph 2
# Save the second figure for the report
ggsave(
  filename = "figure2_final_score_by_ai_usage.png",
  plot = p2,
  width = 7,
  height = 4,
  dpi = 300
)

# Descriptive statistics by AI usage

# Compute summary statistics of final scores by AI usage
stats_by_ai <- data_analysis %>%
  group_by(uses_ai) %>%
  summarise(
    n = n(),                               # number of students
    mean_final_score = mean(final_score), # average score
    median_final_score = median(final_score),
    sd_final_score = sd(final_score)
  )

# Display the table
stats_by_ai


# Graph 3: AI usage time and final score

# Scatterplot with improved readability
# Jitter is used due to the large number of observations
p3_trend <- ggplot(data_analysis, aes(x = ai_usage_time_minutes, y = final_score)) +
  geom_jitter(alpha = 0.25, color = "steelblue", width = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(
    title = "AI Usage Time and Final Academic Score",
    x = "AI usage time (minutes)",
    y = "Final score"
  ) +
  theme_minimal()

# Display the plot
p3_trend

# Save Graph 3
ggsave(
  filename = "figure3_ai_usage_time_vs_final_score.png",
  plot = p3_trend,
  width = 7,
  height = 4,
  dpi = 300
)


# Linear regression analysis

# Estimate the relationship between AI usage time and final score
# while controlling for daily study time
model_1 <- lm(
  final_score ~ ai_usage_time_minutes + study_hours_per_day,
  data = data_analysis
)

# Display regression results
summary(model_1)

