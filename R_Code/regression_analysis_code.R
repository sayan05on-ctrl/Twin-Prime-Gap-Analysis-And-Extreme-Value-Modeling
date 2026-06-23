#=====================================
#REGRESSION ANALYSIS 
#=====================================
analysis_data<-data.frame(
 index=1:length(gaps),
 prime_value=twin_pairs$prime1[-nrow(twin_pairs)],
 Gap_size=gaps
 )


 # REGRESSION 1 : GAP vs INDEX


model_index <- lm(Gap_size ~ index,
                  data = analysis_data)

print(summary(model_index))

# REGRESSION 2 : GAP vs PRIME SIZE


model_prime <- lm(Gap_size ~ prime_value,
                  data = analysis_data)

print(summary(model_prime))


# REGRESSION 3 : GAP vs log(PRIME SIZE)

model_log <- lm(Gap_size ~ log(prime_value),
                data = analysis_data)


print(summary(model_log))


# REGRESSION 4 : GAP vs (log(PRIME SIZE))²


model_log2 <- lm(Gap_size ~ I(log(prime_value)^2),
                 data = analysis_data)

print(summary(model_log2))


# MODEL COMPARISON

print(AIC(
  model_index,
  model_prime,
  model_log,
  model_log2
))

print(BIC(
  model_index,
  model_prime,
  model_log,
  model_log2
))


# R-SQUARED TABLE


r2_table <- data.frame(
  Model = c(
    "Gap vs Index",
    "Gap vs Prime",
    "Gap vs log(Prime)",
    "Gap vs (log Prime)^2"
  ),
  R_Squared = c(
    summary(model_index)$r.squared,
    summary(model_prime)$r.squared,
    summary(model_log)$r.squared,
    summary(model_log2)$r.squared
  )
)

print(r2_table)

## GRAPHICAL PRESENTATION

# GAP vs INDEX


plot(
  analysis_data$index,
  analysis_data$gap_size,
  pch = 16,
  cex = 0.5,
  main = "Gap vs Index",
  xlab = "Index",
  ylab = "Gap Size"
)

abline(model_index,
       col = "red",
       lwd = 2)
legend(
  "topleft",
  legend = c("Observed Gaps", "Regression Line"),
  pch = c(16, NA),
  lty = c(NA, 1),
  col = c("black", "red"),
  bty = "n"
)

# GAP vs PRIME SIZE


plot(
  analysis_data$prime_value,
  analysis_data$gap_size,
  pch = 16,
  cex = 0.5,
  main = "Gap vs Prime Size",
  xlab = "Prime Value",
  ylab = "Gap Size"
)

abline(model_prime,
       col = "blue",
       lwd = 2)
legend(
  "topleft",
  legend = c("Observed Gaps", "Linear Regression"),
  pch = c(16, NA),
  lty = c(NA, 1),
  col = c("black", "blue"),
  bty = "n"
)

# GAP vs log(PRIME)


plot(
  log(analysis_data$prime_value),
  analysis_data$gap_size,
  pch = 16,
  cex = 0.5,
  main = "Gap vs log(Prime)",
  xlab = "log(Prime)",
  ylab = "Gap Size"
)

abline(model_log,
       col = "darkgreen",
       lwd = 2)
legend(
  "topleft",
  legend = c("Observed Gaps", "Log Regression"),
  pch = c(16, NA),
  lty = c(NA, 1),
  col = c("black", "darkgreen"),
  bty = "n"
)

# GAP vs (log(PRIME))^2

plot(
  log(analysis_data$prime_value)^2,
  analysis_data$gap_size,
  pch = 16,
  cex = 0.5,
  main = "Gap vs (log Prime)^2",
  xlab = "(log Prime)^2",
  ylab = "Gap Size"
)

abline(model_log2,
       col = "purple",
       lwd = 2)
legend(
  "topleft",
  legend = c("Observed Gaps", "Regression Line"),
  pch = c(16, NA),
  lty = c(NA, 1),
  col = c("black", "purple"),
  bty = "n"
)

# CONSTRUCTING DATAFRAME 

comparison_table <- data.frame(
  Model = c(
    "Gap vs Index",
    "Gap vs Prime",
    "Gap vs log(Prime)",
    "Gap vs (log Prime)^2"
  ),

  R_Squared = c(
    summary(model_index)$r.squared,
    summary(model_prime)$r.squared,
    summary(model_log)$r.squared,
    summary(model_log2)$r.squared
  ),

  AIC = c(
    AIC(model_index),
    AIC(model_prime),
    AIC(model_log),
    AIC(model_log2)
  ),

  BIC = c(
    BIC(model_index),
    BIC(model_prime),
    BIC(model_log),
    BIC(model_log2)
  )
)

print(comparison_table)

