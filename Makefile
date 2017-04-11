all: 01/hw.pdf 02/hw.pdf

%.pdf: %.tex
	(cd $(@D); for i in "$(seq 3)"; do pdflatex -interaction nonstopmode -shell-escape $(<F); done)

install: 
	- apt-get update
	- apt-get install inkscape texlive-latex-extra texlive-fonts-extra texlive-latex-recommended texlive-lang-czechslovak gnuplot

