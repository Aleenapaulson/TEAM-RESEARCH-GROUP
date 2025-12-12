# 4. Analysis
test_result <- cor.test(stars_clean$Temp, stars_clean$AbsMag, method = "pearson")
print(test_result)

print("\n5. INTERPRETATION\n")

interpret_pearson <- function(test_obj, label){
  r <- as.numeric(test_obj$estimate)
  pval <- test_obj$p.value
  
  if (pval < 0.05) {
    cat(label, ": Pearson r =", round(r,4),
        " statistically significant (p =", signif(pval,4), ").",
        "Interpretation: evidence of a linear relationship between Temperature and Absolute Magnitude.\n")
  } else {
    cat(label, ": Pearson r =", round(r,4),
        " not statistically significant (p =", signif(pval,4), ").",
        "Interpretation: no evidence of a linear relationship between Temperature and Absolute Magnitude.\n")
  }
}

interpret_pearson(test_result, "Temp vs AbsMag")