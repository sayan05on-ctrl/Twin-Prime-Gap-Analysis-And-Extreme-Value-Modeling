# =========================
# 1. PRIME GENERATOR
# =========================

generate_primes <- function(n){

  is_prime <- rep(TRUE, n)
  is_prime[1] <- FALSE

  for(i in 2:floor(sqrt(n))){

    if(is_prime[i]){
      is_prime[seq(i^2, n, by = i)] <- FALSE
    }

  }

  which(is_prime)

}

# =========================
# 2. TWIN PRIME GENERATOR
# =========================

generate_twin_pairs <- function(primes){

  idx <- which((primes + 2) %in% primes)

  twin_pairs <- data.frame(
    prime1 = primes[idx],
    prime2 = primes[idx] + 2
  )

  return(twin_pairs)

}

# =========================
# 3. CONSECUTIVE TWIN PAIR GAPS
# Gap = next prime1 - current prime2
# =========================

generate_gaps <- function(twin_pairs){

  gaps <- twin_pairs$prime1[-1] -
          twin_pairs$prime2[-nrow(twin_pairs)]

  return(gaps)

}

# =========================
# 4. GAP FREQUENCY TABLE
# =========================

gap_frequency <- function(gaps){

  as.data.frame(table(gaps))

}

# =========================
# 5. GROUPED FREQUENCY TABLE
# (Recommended for statistics)
# =========================

grouped_gap_frequency <- function(gaps, width = 20){

  classes <- cut(
    gaps,
    breaks = seq(
      min(gaps),
      max(gaps) + width,
      by = width
    ),
    include.lowest = TRUE
  )

  as.data.frame(table(classes))

}

# =========================
# MAIN PROGRAM
# =========================

N <- 10000000

primes <- generate_primes(N)

twin_pairs <- generate_twin_pairs(primes)

gaps <- generate_gaps(twin_pairs)

# Raw frequency table
freq_table <- gap_frequency(gaps)

# Grouped frequency table
grouped_freq <- grouped_gap_frequency(gaps)

# Outputs
head(twin_pairs)

head(gaps)

freq_table

grouped_freq
