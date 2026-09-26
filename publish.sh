#!/bin/sh
# Copies the game from Google Drive into this site folder and uploads it to GitHub Pages.
# Usage: sh publish.sh "What changed"
set -e
cd "$(dirname "$0")"
cp "/j/My Drive/Documents/Kingdom/kingdom-offline.html" index.html
git add -A
if git diff --cached --quiet; then echo "Nothing new to publish."; exit 0; fi
git commit -q -m "${1:-Update the game}"
git push -q origin main
echo "Published. The site updates within a minute or two: https://bcrob4.github.io/kingdom/"
