make: edo.tex | build-folder
	xelatex --output-directory=build edo.tex
	mv build/edo.pdf .

build-folder:
	mkdir -p build
