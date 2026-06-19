#===========================
# EXTREME VALUE ANALYSIS
#===========================

install.packages("ismev")
library(ismev)


summary(gaps)

quantile(
  gaps,
  probs = c(
    0.90,
    0.95,
    0.97,
    0.99
  )
)

# MEAN RESIDUAL LIFE PLOT

mean_excess <- function(x, u)
{
  excess <- x[x > u] - u

  if(length(excess)==0)
    return(NA)

  mean(excess)
}

thresholds <- seq(
  quantile(gaps,0.80),
  quantile(gaps,0.99),
  length.out = 50
)

mean_excesses <- sapply(
  thresholds,
  function(u)
    mean_excess(gaps,u)
)

plot(
  thresholds,
  mean_excesses,
  type="b",
  pch=16,
  col="blue",
  xlab="Threshold",
  ylab="Mean Excess",
  main="Mean Residual Life Plot"
)


# THRESHOLD CANDIDATES


u95 <- quantile(gaps,0.95)
u97 <- quantile(gaps,0.97)
u99 <- quantile(gaps,0.99)

cat("\nThresholds\n")
print(u95)
print(u97)
print(u99)


# GPD FITS


fit95 <- gpd.fit(
  gaps,
  threshold=u95
)

fit97 <- gpd.fit(
  gaps,
  threshold=u97
)

fit99 <- gpd.fit(
  gaps,
  threshold=u99
)


# PARAMETER ESTIMATES


cat("\n95% Threshold\n")
print(fit95$mle)

cat("\n97% Threshold\n")
print(fit97$mle)

cat("\n99% Threshold\n")
print(fit99$mle)


# COMPARISON TABLE


eva_table <- data.frame(

  Threshold = c(
    "95%",
    "97%",
    "99%"
  ),

  u = c(
    u95,
    u97,
    u99
  ),

  Shape_Xi = c(
    fit95$mle[1],
    fit97$mle[1],
    fit99$mle[1]
  ),

  Scale_Beta = c(
    fit95$mle[2],
    fit97$mle[2],
    fit99$mle[2]
  )

)

print(eva_table)


# DIAGNOSTIC PLOTS


gpd.diag(fit95)

gpd.diag(fit97)

gpd.diag(fit99)


# EXCEEDANCES FOR FINAL THRESHOLD


u_final <- u95

exceedances <- gaps[gaps > u_final]

cat(
  "\nNumber of exceedances = ",
  length(exceedances)
)

hist(
  exceedances,
  breaks = 20,
  main = "Exceedances Above Threshold",
  xlab = "Gap Size"
)


# RETURN LEVELS


shape <- fit99$mle[1]
scale <- fit99$mle[2]

return_periods <- c(
  10,
  20,
  50,
  100
)

return_levels <- u99 +
  (scale/shape) *
  ((return_periods^shape)-1)

return_table <- data.frame(
  Return_Period = return_periods,
  Return_Level = return_levels
)

print(return_table)


# RETURN LEVEL PLOT


plot(
  return_periods,
  return_levels,
  type="b",
  pch=16,
  col="red",
  main="Return Level Plot",
  xlab="Return Period",
  ylab="Return Level"
)

