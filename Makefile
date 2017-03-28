all: 01/hw.pdf 02/hw.pdf

%.pdf: %.tex
	(cd $(@D); pdflatex -interaction nonstopmode -shell-escape $(<F))

install: 
	- apt-get update
	- apt-get install inkscape texlive-latex-extra texlive-fonts-extra texlive-latex-recommended texlive-lang-czechslovak gnuplot

