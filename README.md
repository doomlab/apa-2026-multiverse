# Multiverse analysis: APA 2026 training session

Slides and code for a 90-minute training session on multiverse analysis, by Erin M. Buchanan.

## Abstract

Researchers routinely face many reasonable choices when preparing data and conducting statistical analyses. These analytic decisions can meaningfully influence scientific conclusions, contributing to concerns about reproducibility and researcher degrees of freedom. Multiverse analysis provides a systematic approach for examining how conclusions vary across a range of defensible analytic decisions. This training session will introduce the conceptual foundations of multiverse analysis and explain when and why it should be used in psychological research. Participants will learn how to identify researcher degrees of freedom, construct a principled multiverse, summarize and visualize results, and interpret robustness across alternative analytic decisions. Using practical examples and demonstrations in open source tools, attendees will learn how multiverse analyses can complement preregistration and other open science practices by providing a more complete picture of the robustness of research findings.

## Files

- `multiverse_apa2026.pdf`: the slides as a PDF
- `multiverse_apa2026.html`: the slides as a self-contained HTML file (download and open in a browser; press S for speaker view)
- `multiverse_apa2026.qmd`: the Quarto source for the slides
- `code/sim_toy.R`: the simulator for the toy data used in the demos
- `code/null_sim.R`, `code/null_sim.rds`: the 200-study null simulation and its saved result
- `images/`: screenshots used in the slides
- `render_all.sh`: renders the HTML and the PDF

## Reproducing the slides

You need [Quarto](https://quarto.org), R, and Google Chrome (for the PDF). R packages: `tidyverse`, `broom`, `specr`, `patchwork`, `multiverse`.

```bash
./render_all.sh
```

This renders the HTML slides and prints the PDF. The slides scroll when content overflows. The PDF is built from a non-scrolling version so nothing is cut off.

The data are simulated, so no outside data files are needed. To regenerate the null simulation (takes a minute or two), run `Rscript code/null_sim.R` from this folder.

## Citation

See `CITATION.cff`, or use the "Cite this repository" button on GitHub.

## Image credits

`images/` contains screenshots of journal article pages and figures from published papers, shown for teaching. See the original papers for reuse terms.
