#============================
# STATISTICAL ATTRIBUTE
#============================

mean_gaps<-mean(gaps)
mean_gaps

median_gaps<-median(gaps)
median_gaps

variance_gaps<-var(gaps)
variance_gaps

sd_gaps<-sd(gaps)
sd_gaps

min_gap<-min(gaps)
min_gaps
max_gaps<-max(gaps)
max_gaps

# FIVE POINT SUMMARY

summary(gaps)

[THIS GIVES US THE QUARTILE FOR FURTHER REFERENCE IN STUDY OF ITS DISTRIBUTION]

IQR(gaps)

cv<-sd(gaps)/mean(gaps)
cv

[COEFFICIENT OF VARIATION FOR RELATIVE STUDY]

install.packages("moments")

skewness(gaps)
kurtosis(gaps)

#==============================
# VISUALIZATION 
#==============================


# HISTROGRAM (MOST IMPORTANT)

hist(gaps,main="Twin Prime Gap Distribution",xlab="Gaps",ylab="Frequency")

[HELP FOR UNDERSTANDING SHAPE OF THE DISTRIBUTION ,CENTER OF THE DATA,SPREAD OF THE DATA]

# DENSITY PLOT

plot(density(gaps),main="Density Of Twin Prime Gaps")

[UNDERSTAND THE NATURE OF THE PROBABILTY DISTRIBUTION]

# BOX PLOT

boxplot(gaps,main="Box Plot Of Twin Primes")
[GIVES FIVE POINT SUMMARY]
# EMPIRICAL CDF

plot(ecdf(gaps),main="Empirical CDF",xlab="Gap",ylab="F(x)")

[GIVES PROBABILITY DENSITY]


# QQ PLOT AGAINST NORMAL
[CHECK WHETHER IT IS NORMAL OR NOT]

qqnorm(gaps)
qqline(gaps)

# QQPLOT AGAINS EXPONENTIAL 
[CHECK WHETHER IT IS EXPONENETIAL OR NOT]

library(MASS)

qqplot(qexp(ppoints(length(gaps)),rate=1/mean(gaps)),sort(gaps),
main="QQ PLOT VS EXPONENTIAL")

abline(a=0,b=1)


#FREQUENCY PLOT

[GIVES EXACT FREQUENCY WITHOUT THE GROUPING]

gap_freq<-table(gaps)

plot(as.numeric(names(gap_freq)),as.numeric(gap_freq),type="h",main="FREQUENCY PLOT",
xlab="Gap",ylab="Frequency")

# LOG-FREQUENCY PLOT
[CHECKING FOR POWER LAW DECAY AND EXPOENETIAL DECAY]

plot(as.numeric(names(gap_freq)),log(as.numeric(gap_freq)),type="h",main="FREQUENCY PLOT",
xlab="Gap",ylab="Log(Frequency)")

#===============================
# FOR ANALYSIS CREATE A TABLE
#===============================

analysis_data<-data.frame(
index=1:length(gaps),
prime_value=twin_pairs$prime1[-nrow(twin_pairs)],
Gap_size=gaps
)

head(analysis_data)


#===========================
# VISUALIZATION II
#===========================

# GAP VS INDEX

plot(seq_along(gaps),gaps,pch=16,main="GAP VS INDEX",xlab="Index",ylab="Gap")

# GAP VS PRIME SIZE PLOT

[DIRECTLY RELATED TO TWIN PRIME CONJECTURE
DO LARGER PRIME TEND STO HAVE LARGER GAP?}

prime_value=twin_pairs$prime1[-nrow(twin_pairs)]

plot(prime_value,gaps,pch=16,main="GAP VS PRIME VALUE",xlab="Prime Value",ylab="Gap")

