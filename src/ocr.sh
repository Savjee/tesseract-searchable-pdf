#!/bin/bash

######
# Uses Tesseract OCR engine to make searchable PDF's 
# (with hidden text layer beneath original image).
#
# Only tested on macOS. Install dependencies:
# homebrew install brew install tesseract tesseract-lang gs
# 
# Usage: ./ocr.sh [INPUT_DIRECTORY]
#
# Will write the resulting PDF's into the same
# directory with a "ocr-" prefix.
######


# Check if the input directory exists
dir=$1
[ "$dir" == "" ] && { echo "Usage: $0 directory"; exit 1; }
cd "$dir"


# Check if Tesseract and Ghostscript are installed
if ! [ -x "$(command -v tesseract)" ]; then
  echo 'Error: tesseract is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v gs)" ]; then
  echo 'Error: ghostscript is not installed.' >&2
  exit 1
fi


# Loop over all PDF's in this directory
for i in *.pdf; do
    [ -f "$i" ] || break

    # Convert to tif
    gs -sDEVICE=tiff32nc -r300 -o "$i.tif" "$i"

    pdfBase=$(basename -- "$i")
    pdfName=${pdfBase%.*}

    # Run OCR and output it as PDF
    tesseract -l nld "$i.tif" "ocr-$pdfName" pdf

    # Remove the tif file
    rm "$i.tif"
done
