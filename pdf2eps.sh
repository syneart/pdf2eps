#!/bin/sh
# $Id: pdf2eps,v 0.01 2005/10/28 00:55:46 Herbert Voss Exp $
# pdf2eps Shell script by SyneArt <sa@syneart.com> 2017/08/28
# Convert PDF to encapsulated PostScript.
# usage:
# pdf2eps.sh <page number> <pdf file>

usage () {
    echo "Usage: pdf2eps.sh <page number> <pdf file>"
}

if [ "$1/" == "/" ]; then usage; exit; fi
if [ "$2/" == "/" ]; then usage; exit; fi

# remove ext
ORIGINAL_PDF_FILE="${2%.[^.]*}"

pdfcrop "${ORIGINAL_PDF_FILE}.pdf"
(pdftops -v) >/dev/null 2>&1 && {
    pdftops -f $1 -l $1 -eps "${ORIGINAL_PDF_FILE}-crop.pdf"
    echo "==> Creating output file ${ORIGINAL_PDF_FILE}.eps."
    rm "${ORIGINAL_PDF_FILE}-crop.pdf"
} || {
    echo "==> Warning: pdftops command not found, use other command now .."
    pdf2ps "${ORIGINAL_PDF_FILE}-crop.pdf" "${ORIGINAL_PDF_FILE}-crop.ps"
    ps2eps "${ORIGINAL_PDF_FILE}-crop.ps"
    rm "${ORIGINAL_PDF_FILE}-crop.pdf" "${ORIGINAL_PDF_FILE}-crop.ps"
}
mv "${ORIGINAL_PDF_FILE}-crop.eps" "${ORIGINAL_PDF_FILE}.eps"
exit 0
