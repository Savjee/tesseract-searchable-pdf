# tesseract-searchable-pdf
Simple bash script to make searchable PDF's with [Tesseract OCR](https://github.com/tesseract-ocr/) (adds a hidden text layer underneath the original image).


## Usage
The script takes 1 argument: the directory in which your PDF's are stored:

```
./ocr.sh /path/to/directory/with/pdfs
```

It will output searchable PDF's in the same directory, with an `ocr-` prefix.

## Install dependencies

This script requires tesseract and ghostscript, which on a Mac can be installed with [Homebrew](https://brew.sh):

```
brew install brew install gs tesseract tesseract-lang
```

## Known issues

* The output PDF files are much bigger than the input ones
* No multithreading, 1 file at a time
