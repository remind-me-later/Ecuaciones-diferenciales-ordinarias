.POSIX:

all: src/edo.pdf

src/edo.pdf: src/edo.tex src/teoria/*.tex | build 
	cd src
	latexmk -pdf -xelatex -output-directory=../build -cd src/edo.tex
	mv build/edo.pdf .

build:
	mkdir -p build

clean:
	$(RM) build/* edo.pdf

.PHONY: all clean
