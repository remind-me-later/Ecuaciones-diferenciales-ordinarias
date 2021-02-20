.POSIX:

name=ecuaciones_diferenciales
srcdir:=src
sources:=$(shell find $(srcdir) -name '*.tex')

all: $(name).pdf

$(name).pdf: $(sources) | build 
	latexmk -pdf -xelatex -output-directory=../build -cd src/$(name).tex
	mv build/$(name).pdf .

build:
	mkdir -p build

clean:
	$(RM) build/* $(name).pdf

.PHONY: all clean
