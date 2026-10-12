#!/bin/bash
# Renders the scrolling HTML slides and an unclipped PDF for sharing.
# Run from this folder:  ./render_all.sh
set -e
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
QMD=multiverse_apa2026.qmd
HTML=multiverse_apa2026.html

# 1. PDF: render without scrolling so nothing is clipped, then print via Chrome
quarto render $QMD -M scrollable:false
"$CHROME" --headless=old --disable-gpu --no-pdf-header-footer \
  --run-all-compositor-stages-before-draw --virtual-time-budget=60000 \
  --print-to-pdf=multiverse_apa2026.pdf "file://$PWD/$HTML?print-pdf" >/dev/null 2>&1

# 2. HTML: re-render with the scrolling set in the qmd header
quarto render $QMD
echo "Done: $HTML (scrolling) and multiverse_apa2026.pdf"
