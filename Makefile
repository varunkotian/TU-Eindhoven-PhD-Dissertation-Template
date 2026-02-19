
.PHONY: force-build

all: dissertation.pdf propositions.pdf dissertation_print.pdf

force-build:


dissertation.pdf: figs force-build
	latexmk -xelatex dissertation
	makeglossaries dissertation

propositions.pdf: force-build
	latexmk -xelatex propositions

dissertation_print.pdf: dissertation.pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -sOutputFile=dissertation_print.pdf -f dissertation.pdf

clean:
	rubber --clean dissertation.tex
	rm -f dissertation.pdf
