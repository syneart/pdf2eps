:: $Id: pdf2eps,v 0.01 2005/10/28 00:55:46 Herbert Voss Exp $
:: pdf2eps Batch file by SyneArt <sa@syneart.com> 2017/08/27
:: Convert PDF to encapsulated PostScript.
:: usage:
:: pdf2eps.bat <page number> <pdf file>
@echo off&cls

if %1/==/ goto usage
if %2/==/ goto usage

set ORIGINAL_PDF_FILE=%~p2%~n2

pdfcrop "%ORIGINAL_PDF_FILE%.pdf"
pdftops -f %1 -l %1 -eps "%ORIGINAL_PDF_FILE%-crop.pdf" 
erase "%ORIGINAL_PDF_FILE%-crop.pdf"
move "%ORIGINAL_PDF_FILE%-crop.eps" "%ORIGINAL_PDF_FILE%.eps"
goto end

:usage
echo "Usage: pdf2eps.bat <page number> <pdf file>"

:end
