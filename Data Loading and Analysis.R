# Load necessary library
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
library(gridExtra)

# 1. Load Data
# (Assuming the file is in the working directory or Downloads)
# We use check.names=FALSE to see original names, but we will rename them immediately for ease
if(file.exists("6 class csv (1).csv")) {
  stars <- read.csv("6 class csv (1).csv")
} else {
  # Adjust this path if necessary
  setwd("C:/Users/victus/Downloads")
  stars <- read.csv("6 class csv (1).csv")
}

# RENAME COLUMNS to make them easier to use in code
# Mapping: Temp(K), Luminosity, Radius, AbsMag, Type, Color, Spectral
colnames(stars) <- c("Temp", "Luminosity", "Radius", "AbsMag", "StarType", "StarColor", "SpectralClass")