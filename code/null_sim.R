# 200 null studies (d = 0), each run through the full 108-spec multiverse.
# Takes ~1-2 min; the deck reads the saved result.
library(tidyverse); library(broom)
source("code/sim_toy.R")
decisions <- expand_grid(
  exclusion  = c("none", "attention", "speeders", "both"),
  outliers   = c("none", "3sd", "2sd"),
  dv         = c("full_mean", "short_mean", "first_item"),
  covariates = c("none", "age", "age_gender"))
qmd <- readLines("multiverse_apa2026.qmd")             # reuse the deck's functions
for (f in c("apply_exclusion", "score_dv", "drop_outliers", "fit_model", "fit_spec")) {
  s <- grep(paste0("^", f, " <- "), qmd)[1]
  e <- s + which(qmd[s:length(qmd)] == "}")[1] - 1
  eval(parse(text = qmd[s:e]))
}
null_sim <- map_dfr(1:200, \(i) {
  mv <- decisions |>
    mutate(res = pmap(list(exclusion, outliers, dv, covariates),
                      \(e, o, d, c) fit_spec(sim_toy(d = 0, seed = 1000 + i), e, o, d, c))) |>
    unnest(res)
  tibble(i, any_sig = any(mv$p.value < .05), pct_sig = mean(mv$p.value < .05),
         first_sig = mv$p.value[1] < .05)
})
saveRDS(null_sim, "code/null_sim.rds")
