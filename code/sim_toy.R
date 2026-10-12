# Toy data: does a brief gratitude exercise (treat) raise well-being?
# One simulator, two worlds: a small true effect vs. no effect.
library(tidyverse)

sim_toy <- function(n = 300, d = 0.25, seed = 1) {
  set.seed(seed)
  tibble(
    id      = 1:n,
    treat   = rep(0:1, length.out = n),
    age     = round(rnorm(n, 35, 11)),
    gender  = sample(c("woman", "man", "nonbinary"), n, replace = TRUE, prob = c(.5, .45, .05)),
    minutes = rlnorm(n, log(8), .5),                    # time spent on the survey
    attn_ok = rbinom(n, 1, plogis(.5 + .15 * scale(minutes)[, 1]) * .95 + .02)
  ) |>
    mutate(
      latent = rnorm(n) + d * treat + .01 * (age - 35),
      # careless responders add noise instead of signal
      noise_sd = if_else(attn_ok == 1, .8, 2.2),
      wb1 = latent + rnorm(n, 0, noise_sd),
      wb2 = latent + rnorm(n, 0, noise_sd),
      wb3 = latent + rnorm(n, 0, noise_sd),
      wb4 = latent + rnorm(n, 0, noise_sd),
      wb5 = latent + rnorm(n, 0, noise_sd),
      wb6 = .5 * latent + rnorm(n, 0, noise_sd + .5),   # weaker items
      wb7 = .5 * latent + rnorm(n, 0, noise_sd + .5),
      wb8 = .5 * latent + rnorm(n, 0, noise_sd + .5)
    ) |>
    select(-latent, -noise_sd)
}
