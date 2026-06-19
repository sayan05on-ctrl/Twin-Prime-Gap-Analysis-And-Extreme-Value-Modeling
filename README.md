# Twin-Prime-Gap-Analysis-And-Extreme-Value-Modeling
# Twin Prime Gap Analysis and Extreme Value Modeling

## Overview

This repository contains the R scripts, supplementary materials, and computational analyses developed for the project *"Statistical Analysis of Gaps Between Consecutive Twin Prime Pairs."*
The project investigates the statistical behaviour of gaps between successive twin-prime pairs through a combination of computational number theory and statistical modelling. The study includes the generation of twin-prime pairs, exploratory data analysis, probability distribution fitting, mean-shifting analysis, regression modelling, and Extreme Value Analysis (EVA).
The primary objective is to examine whether twin-prime gaps exhibit identifiable statistical patterns and to explore their behaviour from both distributional and extreme-value perspectives. Particular emphasis is placed on understanding the growth of average gap sizes, modelling the overall distribution of gaps, and characterising rare and exceptionally large gaps using the Generalized Pareto Distribution (GPD).
All analyses were performed in R, and the repository is intended to promote transparency, reproducibility, and accessibility of the computational methods used throughout the project.
---

## Objectives

The main objectives of this study are:

- Generate twin-prime pairs computationally.
- Construct gaps between consecutive twin-prime pairs.
- Explore the statistical properties of the gap distribution.
- Identify an appropriate probability distribution for modelling the gaps.
- Investigate the growth pattern of gaps through regression analysis.
- Examine the behaviour of extreme gaps using Extreme Value Theory (EVT).

---

## Methodology

### 1. Data Generation

Prime numbers were generated computationally using a prime-generation algorithm. Twin-prime pairs $(p,p+2)$ were extracted from the generated prime sequence.

The gap between consecutive twin-prime pairs was then calculated and used as the primary dataset for analysis.

### 2. Exploratory Data Analysis (EDA)

Exploratory analysis included:

- Histograms
- Kernel Density Estimation
- Empirical Cumulative Distribution Function (ECDF)
- Boxplots
- Summary Statistics

The EDA revealed:

- Strong positive skewness
- Long right tail
- Increasing variability
- Gradual rightward shift in average gap size

These observations suggested that the distribution of twin-prime gaps evolves as larger primes are considered.

### 3. Distribution Fitting

Several probability distributions were fitted to the observed gaps:

- Exponential Distribution
- Gamma Distribution
- Weibull Distribution
- Lognormal Distribution

Model comparison was performed using:

- Log-Likelihood
- Akaike Information Criterion (AIC)
- Bayesian Information Criterion (BIC)
- Kolmogorov–Smirnov Test

The fitted models were compared to determine the most suitable statistical representation of the gap distribution.

### 4. Mean Shifting Analysis

A mean-shifting analysis was conducted by dividing the data into consecutive blocks and comparing local average gap sizes.

The analysis demonstrated a gradual rightward shift of the mean, indicating that larger twin-prime gaps become increasingly common as the prime range expands.

### 5. Regression Analysis

Regression models were used to investigate the relationship between twin-prime gaps and the growth of prime numbers.

The following relationships were examined:

- Gap vs Index
- Gap vs Prime Size
- Gap vs log(Prime)
- Gap vs (log(Prime))²

Linear regression models were fitted and evaluated using:

- R²
- AIC
- BIC

The results support the theoretical expectation that average prime-gap behaviour is closely related to logarithmic growth.

### 6. Extreme Value Analysis (EVA)

Extreme Value Theory was applied using the Peaks-Over-Threshold (POT) approach.

The analysis included:

- Mean Residual Life (MRL) Plot
- Threshold Selection
- Generalized Pareto Distribution (GPD) Fitting
- Probability Plot
- Quantile Plot
- Density Plot
- Return Level Plot

Thresholds corresponding to the 95th, 97th and 99th percentiles were investigated. The 95th percentile threshold was selected as the final threshold based on diagnostic performance and parameter stability.

---

## Software

The analysis was conducted in *R* using packages including:

- fitdistrplus
- ggplot2
- moments
- MASS
- ismev
- evd

---

## Key Topics

- Twin Primes
- Prime Gap Analysis
- Distribution Fitting
- Regression Modeling
- Extreme Value Theory
- Generalized Pareto Distribution
- Statistical Computing in R

---

## Author

*Sayan Dhar*  
Department of Statistics  
Ramakrishna Mission Residential College, Narendrapur

---
## Acknowledgements

The author would like to express sincere gratitude to the following contributors for their support and assistance during the completion of this project.

### Principal Contributor

*Soumik Samanta*

For continuous collaboration, discussion, implementation support, and active participation throughout the entire project. This work was completed through substantial joint effort, and his contributions were invaluable at every stage of the study.

### Additional Support

*Krishnanu Maiti*

For providing helpful suggestions and occasional assistance during various stages of the project.

*Rupam Bachar*

For offering support and contributing useful inputs related to the development of the project.

*Joydeep Chowdhury*

For providing assistance and encou

---
## License

This repository is intended for academic and research purposes.
