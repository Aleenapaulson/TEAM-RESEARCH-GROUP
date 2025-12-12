# 3. Visualization

# A. Main Scatter Plot (The HR Diagram)
# Note: In Astrophysics, HR Diagrams usually invert the axes. 
# I added scale_x_reverse and scale_y_reverse to make it scientifically correct for stars.
plot_scatter <- ggplot(stars_clean, aes(x = Temp, y = AbsMag)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  scale_x_reverse() + # Inverted X for Temperature (Hot left, Cool right)
  scale_y_reverse() + # Inverted Y for Magnitude (Bright top, Dim bottom)
  labs(title = "Figure 1: Scatter Plot (HR Diagram)",
       subtitle = "Temperature vs Absolute Magnitude",
       x = "Temperature (K)", y = "Absolute Magnitude (Mv)") +
  theme_minimal()

# B. Supplementary Histograms WITH BELL CURVE

# Calculate statistics for the Normal Curve (Absolute Magnitude)
mag_mean <- mean(stars_clean$AbsMag, na.rm = TRUE)
mag_sd   <- sd(stars_clean$AbsMag, na.rm = TRUE)

plot_hist_mag <- ggplot(stars_clean, aes(x = AbsMag)) +
  # 1. Set y = ..density.. so histogram creates a density plot
  geom_histogram(aes(y = ..density..), fill = "green", bins = 30, color = "white") +
  # 2. Add the Normal Curve using stat_function
  stat_function(fun = dnorm, 
                args = list(mean = mag_mean, sd = mag_sd), 
                color = "black", size = 1) +
  labs(title = "Abs. Magnitude Distribution with Normal Curve", 
       x = "Absolute Magnitude", y = "Density") + 
  theme_minimal()

# (Temp Histogram)
plot_hist_temp <- ggplot(stars_clean, aes(x = Temp)) +
  geom_histogram(fill = "orange", bins = 30, color = "white") +
  labs(title = "Temperature Distribution", x = "Temperature (K)") + 
  theme_minimal()

# C. Boxplot
plot_box <- ggplot(stars_clean, aes(x = temp_cat, y = AbsMag, fill = temp_cat)) +
  geom_boxplot() +
  scale_y_reverse() + # Reverse Y axis here too for consistency (Brighter at top)
  labs(title = "Figure 2: Magnitude Levels by Star Temperature",
       x = "Temperature Category", y = "Absolute Magnitude") +
  scale_fill_manual(values = c("orange", "lightblue")) +
  theme_minimal() +
  theme(legend.position = "none")

# Save plots
ggsave("scatter_plot_stars.png", plot = plot_scatter)
ggsave("boxplot_stars.png", plot = plot_box)
ggsave("histograms_stars_curve.png", plot = grid.arrange(plot_hist_temp, plot_hist_mag, ncol=2))

print("Plots saved: scatter_plot_stars.png, boxplot_stars.png, and histograms_stars_curve.png")