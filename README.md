# pdf2eps
Convert PDF to encapsulated PostScript

### In Windows

You can use Windows command line (a.k.a. cmd) , and type (change directory to bash file location)

`./pdf2eps.bat <page number> <pdf file>`

for example,

`./pdf2eps.bat 1 input.pdf`

### In Unix (include MacOS)

You can use Terminal , and type (change directory to bash file location)

`$ bash ./pdf2eps.sh <page number> <pdf file>`

for example,

`$ bash ./pdf2eps.sh 1 input.pdf`

## Requirement
1. TeXLive
2. If your `pdftops` command is not found , you must install `poppler`.

## License

The code is based on Herbert's accepted answer. You can found [here](https://tex.stackexchange.com/questions/20883/how-to-convert-pdf-to-eps).

This program released under [MIT License](LICENSE).
