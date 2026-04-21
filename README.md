# Reproducible reports with Quarto

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18848356.svg)](https://doi.org/10.5281/zenodo.18848356)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Training materials for a two-hour online workshop introducing [Quarto](https://quarto.org/), a scientific and technical publishing system for reproducible research. Developed as part of the [UKRI Digital Research Skills Catalyst](https://digitalskillscatalyst.ac.uk/) (funded by UKRI/ST/B000299/1).

🌐 **Workshop website:** https://ukri-digital-research-skills-catalyst.github.io/quarto-intro/

---

## Overview

This workshop teaches participants how to integrate code, results, and narrative text in a single Quarto document to produce professional, reproducible reports. It is taught using R and RStudio, using [Gapminder](https://www.gapminder.org/) data on global development as the worked example.

By the end of the workshop, participants can transform raw data into a polished HTML, Word, or PDF report where the text and analysis remain in sync automatically.

## Audience

Researchers, research support staff, and others in academia or industry who regularly produce reports involving data analysis. Some familiarity with RStudio and beginner-level R is assumed.

## Learning objectives

Participants will learn how to:

- Construct a structured Quarto (`.qmd`) document using YAML headers to define metadata
- Format narrative text using Markdown syntax
- Integrate R code chunks to produce tables and visualisations within the document
- Use inline code to insert dynamic statistics that update automatically if the data changes
- Control output with chunk options (e.g. hiding code while showing results)
- Render a single source document into multiple formats (HTML, Word, PDF)

## Repository structure

```
quarto-intro/
├── index.qmd          # Welcome page and workshop overview
├── before.qmd         # Pre-course setup instructions
├── materials.qmd      # Workshop materials and exercises
├── _quarto.yml        # Quarto project configuration
├── styles.css         # Custom CSS styling
├── references.bib     # Bibliography
├── data-raw/          # Gapminder dataset
├── images/            # Logo and other images
├── .github/workflows/ # GitHub Actions for building and deploying the site
└── CITATION.cff       # Citation metadata
```

## Building the site locally

You will need [Quarto](https://quarto.org/docs/get-started/) and R with the following packages installed:

```r
install.packages(c("tidyverse", "knitr", "kableExtra", "xml2", "downlit"))
```

Then render the site with:

```bash
quarto render
```

or preview it with:

```bash
quarto preview
```

The site is automatically built and deployed to GitHub Pages on every push to `main` via the GitHub Actions workflow in `.github/workflows/`.

## Instructor

**Emma Rand**, Professor, Department of Biology, University of York
([ORCID: 0000-0002-1358-8275](https://orcid.org/0000-0002-1358-8275))

Emma specialises in teaching data science and reproducibility, particularly to those who do not see themselves as programmers. She leads [Cloud-SPAN](https://cloud-span.york.ac.uk/) and the [UKRI Digital Research Skills Catalyst](https://digitalskillscatalyst.ac.uk/).

## Citation

If you use or reuse these materials, please cite them:

> Rand, E. (2026). *Reproducible reports with Quarto. A UKRI Digital Research Skills Catalyst workshop* (v0.1.0-alpha). Zenodo. https://doi.org/10.5281/zenodo.18848356

Or use the `CITATION.cff` file in this repository.

## License

These materials are licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) — you are free to share and adapt them for non-commercial purposes, provided you give appropriate credit and distribute any adaptations under the same licence.
