#================================
# FITTING THE DISTRIBUTION 
#================================

install.packages("fitdistrplus")
install.packages("MASS")


library(fitdistrplus)
library(MASS)

#  FIRST OF ALL SEE EXPONENTIAL FITTING 

exp_fit<-fitdist(gaps+1,"exp")
summary(exp_fit)
exp_fit$estimate

# OVERLAYING THE CURVE 
[HISTOGRAM+EXPONENTIAL CURVE]

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Exponential Fit",
xlab="Gap"
)

curve(
dexp(x,rate=exp_fit$estimate),
add=TRUE,lwd=2
)

# GAMMA DISTRIBUTION FITTING 

gamma_fit<-fitdist(gaps+1,"gamma")
summary(gamma_fit)
gamma_fit$estimate

# OVERLAY WITH HISTOGRAM 

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Gamma Fit",
xlab="Gap"
)

curve(
dgamma(x,shape=gamma_fit$estimate["shape"],rate=gamma_fit$estimate["rate"]),
add=TRUE,lwd=2
)

# OVERLAY WITH HISTOGRAM + EXPONENTIAL FIT AND GAMMA FIT

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Gamma Fit",
xlab="Gap"
)

curve(
dgamma(x,shape=gamma_fit$estimate["shape"],rate=gamma_fit$estimate["rate"]),
add=TRUE,lwd=2
)

curve(
dexp(x,rate=exp_fit$estimate),
add=TRUE,lwd=2,lty=2
)

legend("topright",legend=c("Gamma","Exponential"),lty=c(1,2),lwd=2)


# WEIBULL DISTRIBUTION FITTING

wei_fit<-fitdist(gaps+1,"weibull")
summary(wei_fit)
wei_fit$estimate

# HISTOGRAM OVERLAY WITH WEIBULL

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Weibull Fit",
xlab="Gap"
)

curve(
dweibull(x,shape=wei_fit$estimate["shape"],scale=wei_fit$estimate["scale"]),
add=TRUE,lwd=2
)

# LOG-NORMAL DISTRIBUTION FITTING

ln_fit<-fitdist(gaps+1,"lnorm")
summary(ln_fit)
ln_fit$estimate

# HISTOGRAM OVERLAY WITH LOG-NORMAL

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Log-Normal Fit",
xlab="Gap"
)

curve(
dlnorm(x,meanlog=ln_fit$estimate["meanlog"],sdlog=ln_fit$estimate["sdlog"]),
add=TRUE,lwd=2
)

#==========================  
# GOODNESS OF FITTING
#==========================

# FIRST OF CHECK AIC AND BIC SCORE 

AIC_values<-c( Exponential=exp_fit$aic,
Gamma=gamma_fit$aic,Weibull=wei_fit$aic,"Log-Normal"=ln_fit$aic)

AIC_values

BIC_values<-c( Exponential=exp_fit$bic,
Gamma=gamma_fit$bic,Weibull=wei_fit$bic,"Log-Normal"=ln_fit$bic)

BIC_values

# NOW DO KS-TEST FOR THAT 

Exp_ks<-ks.test(gaps+1,"pexp",rate=exp_fit$estimate)
Exp_ks

Gamma_ks<-ks.test(gaps+1,"pgamma",shape=gamma_fit$estimate["shape"],
rate=gamma_fit$estimate["rate"])
Gamma_ks

Weibull_ks<-ks.test(gaps+1,"pweibull",shape=wei_fit$estimate["shape"],
scale=wei_fit$estimate["scale"])
Weibull_ks

Ln_ks<-ks.test(gaps+1,"plnorm",meanlog=ln_fit$estimate["meanlog"],
sdlog=ln_fit$estimate["sdlog"])
Ln_ks

denscomp(
list(exp_fit,gamma_fit,wei_fit,ln_fit),
legendtext=c("Exponential","Gamma","Weibull","Log-Normal"),
fitcol=c("red","green","blue","grey"),fitlwd=3,fitlty=c(1,2,3,4),
main="Density Compariosn Of Fitted Distribution"
)


#  CDF COMPARISON

cdfcomp(
list(exp_fit,gamma_fit,wei_fit,ln_fit),
legendtext=c("Exponential","Gamma","Weibull","Log-Normal"),
fitcol=c("red","green","blue","grey"),fitlwd=3,fitlty=c(1,2,3,4),
main="CDF Compariosn Of Fitted Distribution"
)


# DENSITY COMPARISON

denscomp(
list(exp_fit,gamma_fit,wei_fit,ln_fit),
legendtext=c("Exponential","Gamma","Weibull","Log-Normal"),
fitcol=c("red","green","blue","grey"),fitlwd=3,fitlty=c(1,2,3,4),
main="Density Compariosn Of Fitted Distribution"
)

# QQ COMPARISON

qqcomp(list(exp_fit,gamma_fit,wei_fit,ln_fit),
legendtext=c("Exponential","Gamma","Weibull","Log-Normal"),
fitcol=c("red","green","blue","grey"),fitlwd=3,
main="Density Compariosn Of Fitted Distribution"
)

# PP COMPARISON 

ppcomp(list(exp_fit,gamma_fit,wei_fit,ln_fit),
legendtext=c("Exponential","Gamma","Weibull","Log-Normal"),
fitcol=c("red","green","blue","grey"),fitlwd=3,
main="Density Compariosn Of Fitted Distribution"
)
#===================================
#CREATE THE TABLE FOR GOODNESS OF FITTING 
#===================================
gof_table <- data.frame(

  Distribution = c(
    "Exponential",
    "Gamma",
    "Weibull",
    "Lognormal"
  ),

  AIC = c(
    exp_fit$aic,
    gamma_fit$aic,
    weib_fit$aic,
    ln_fit$aic
  ),

  BIC = c(
    exp_fit$bic,
    gamma_fit$bic,
    weib_fit$bic,
    ln_fit$bic
  ),

  KS_Statistic = c(
    ks_exp$statistic,
    ks_gamma$statistic,
    ks_weib$statistic,
    ks_ln$statistic
  ),

  KS_Pvalue = c(
    ks_exp$p.value,
    ks_gamma$p.value,
    ks_weib$p.value,
    ks_ln$p.value
  )

)

gof_table
gof_table$Rank_AIC <- rank(gof_table$AIC)

gof_table
#================================
# FITTING DISCREATE DISTRIBUTION (WHY NOT PREFERABLE)
#================================

# POSISSON FITTING

poi_fit<-fitdist(gaps+1,"pois")
summary(poi_fit)
poi_fit$estimate

# HISTOGRAM OVERLAY WITH POSISSON

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Poisson Fit",
xlab="Gap"
)
x<-0:max(gaps)
points(x,
dpois(x,lambda=poi_fit$estimate),
type="h",lwd=2
)

# GEOMETRIC FITTING

geo_fit<-fitdist(gaps+1,"geom")
summary(geo_fit)
geo_fit$estimate

# HISTOGRAM OVERLAY WITH POSISSON

hist(
gaps+1,
probability=TRUE,
breaks=30,
main="Geometric Fit",
xlab="Gap"
)
x<-0:max(gaps)
points(x,
dgeom(x,prob=geo_fit$estimate),
type="h",lwd=2
)


gof1_table <- data.frame(

  Distribution = c(
    "Poisson",
    "Geometric"
  ),

  AIC = c(
    poi_fit$aic,
    geo_fit$aic
  ),

  BIC = c(
    poi_fit$bic,
    geo_fit$bic
  )
)

gof1_table
