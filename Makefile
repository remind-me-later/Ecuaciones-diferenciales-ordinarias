.POSIX:

name=ecuaciones_diferenciales

all: src/$(name).pdf

src/$(name).pdf: src/$(name).tex src/teoria/*.tex | build 
	latexmk -pdf -xelatex -output-directory=../build -cd src/$(name).tex
	mv build/$(name).pdf .

build:
	mkdir -p build

clean:
	$(RM) build/* $(name).pdf

.PHONY: all clean
