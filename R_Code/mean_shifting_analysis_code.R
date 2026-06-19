#===============================================================
# 0BSERVING THE SHIFTING OF MEAN VARYING THE SIZE OF THE DATASET
#===============================================================

N <- 1e4

primes <- generate_primes(N)

twin_pairs <- generate_twin_pairs(primes)

gaps_1e4<- generate_gaps(twin_pairs)

# Raw frequency table
freq_table <- gap_frequency(gaps_1e4)

# Grouped frequency table
grouped_freq <- grouped_gap_frequency(gaps_1e4)

# Outputs
head(gaps_1e4)

freq_table

grouped_freq
==============================
N <- 1e5

primes <- generate_primes(N)

twin_pairs <- generate_twin_pairs(primes)

gaps_1e5<- generate_gaps(twin_pairs)

# Raw frequency table
freq_table <- gap_frequency(gaps_1e5)

# Grouped frequency table
grouped_freq <- grouped_gap_frequency(gaps_1e5)

# Outputs
head(gaps_1e5)

freq_table

grouped_freq

===================================

N <- 1e6

primes <- generate_primes(N)

twin_pairs <- generate_twin_pairs(primes)

gaps_1e6<- generate_gaps(twin_pairs)

# Raw frequency table
freq_table <- gap_frequency(gaps_1e6)

# Grouped frequency table
grouped_freq <- grouped_gap_frequency(gaps_1e6)

# Outputs
head(gaps_1e6)

freq_table

grouped_freq
============================================

N <- 1e7

primes <- generate_primes(N)

twin_pairs <- generate_twin_pairs(primes)

gaps_1e7<- generate_gaps(twin_pairs)

# Raw frequency table
freq_table <- gap_frequency(gaps_1e7)

# Grouped frequency table
grouped_freq <- grouped_gap_frequency(gaps_1e7)

# Outputs
head(gaps_1e7)

freq_table

grouped_freq


#========================
# OBSERVING MEAN SHIFTING
#========================
library(fitdistrplus)

# Combined data
all_gaps <- c(
  gaps_1e4,
  gaps_1e5,
  gaps_1e6,
  gaps_1e7
)

# H0: One Gamma for all data
fit0 <- fitdist(
  all_gaps + 1,
  "gamma"
)

logL0 <- fit0$loglik

# H1: Separate Gamma distributions
fit1 <- fitdist(
  gaps_1e4 + 1,
  "gamma"
)

fit2 <- fitdist(
  gaps_1e5 + 1,
  "gamma"
)

fit3 <- fitdist(
  gaps_1e6 + 1,
  "gamma"
)

fit4 <- fitdist(
  gaps_1e7 + 1,
  "gamma"
)

logL1 <-
  fit1$loglik +
  fit2$loglik +
  fit3$loglik +
  fit4$loglik

# Likelihood Ratio Statistic
LR <- -2 * (logL0 - logL1)

# Degrees of Freedom
df <- 8 - 2

# p-value
p_value <- 1 - pchisq(LR, df)

cat("LR =", LR, "\n")
cat("p-value =", p_value, "\n")

 gamma_table <- data.frame(

  Dataset = c(
    "1e4",
    "1e5",
    "1e6",
    "1e7"
  ),

  Shape = c(
    fit1$estimate["shape"],
    fit2$estimate["shape"],
    fit3$estimate["shape"],
    fit4$estimate["shape"]
  ),

  Rate = c(
    fit1$estimate["rate"],
    fit2$estimate["rate"],
    fit3$estimate["rate"],
    fit4$estimate["rate"]
  )
)

gamma_table$Mean <-
  gamma_table$Shape /
  gamma_table$Rate

gamma_table

# VISUALIZATION

plot(
  log10(c(1e4,1e5,1e6,1e7)),
  gamma_table$Mean,
  type="b",
  pch=19,
  xlab="log10(Prime Limit)",
  ylab="Gamma Mean Gap",
  main="Shifting of Gamma Mean with Dataset Size"
)

# DENSITY PLOT
x <- seq(0, max(gaps_1e7), length=1000)

plot(
  x,
  dgamma(
    x,
    shape=fit1$estimate["shape"],
    rate=fit1$estimate["rate"]
  ),
  type="I",
  lwd=3,
  col="red",
  xlab="Twin Prime Gap",
  ylab="Density",
  main="Gamma Density Shift with Dataset Size"
)

lines(
  x,
  dgamma(
    x,
    shape=fit2$estimate["shape"],
    rate=fit2$estimate["rate"]
  ),
  lwd=3,
  col="blue"
)

lines(
  x,
  dgamma(
    x,
    shape=fit3$estimate["shape"],
    rate=fit3$estimate["rate"]
  ),
  lwd=3,
  col="green"
)

lines(
  x,
  dgamma(
    x,
    shape=fit4$estimate["shape"],
    rate=fit4$estimate["rate"]
  ),
  lwd=3,
  col="black"
)

legend(
  "topright",
  legend=c("10^4","10^5","10^6","10^7"),
  col=c("red","blue","green","black"),
  lwd=3
)

# SEE SAME CASES FOR DISCREATE CASE

 library(fitdistrplus)

all_gaps <- c(
  gaps_1e4,
  gaps_1e5,
  gaps_1e6,
  gaps_1e7
)

# H0
geom0 <- fitdist(
  all_gaps + 1,
  "geom"
)

logL0 <- geom0$loglik

# H1
geom1 <- fitdist(
  gaps_1e4 + 1,
  "geom"
)

geom2 <- fitdist(
  gaps_1e5 + 1,
  "geom"
)

geom3 <- fitdist(
  gaps_1e6 + 1,
  "geom"
)

geom4 <- fitdist(
  gaps_1e7 + 1,
  "geom"
)

logL1 <-
  geom1$loglik +
  geom2$loglik +
  geom3$loglik +
  geom4$loglik

LR_geom <- -2 * (logL0 - logL1)

df_geom <- 4 - 1

p_geom <- 1 - pchisq(
  LR_geom,
  df_geom
)

cat("LR =", LR_geom, "\n")
cat("p-value =", p_geom, "\n")

geom_table <- data.frame(

 Dataset = c(
  "1e4",
  "1e5",
  "1e6",
  "1e7"
 ),

 p = c(
  geom1$estimate,
  geom2$estimate,
  geom3$estimate,
  geom4$estimate
 )
)


geom_table$Mean <-
 (1 - geom_table$p) /
 geom_table$p

geom_table

