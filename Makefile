.POSIX:

name=elementos_de_ecuaciones_diferenciales_ordinarias
sources:=$(shell find src -maxdepth 2 -name '*.tex')
makefiles:=$(shell find . -mindepth 1 -maxdepth 4 -type f -name Makefile)
subdir:=$(filter-out ./,$(dir $(makefiles)))

all: pdf/$(name).pdf

figures:
	for dir in $(subdir); do \
        make -C $$dir all; \
    done

pdf/$(name).pdf: $(sources) | figures build pdf
	latexmk -pdf -xelatex -output-directory=../build -cd src/main.tex
	mv build/main.pdf $@

build:
	mkdir -p build

pdf:
	mkdir -p pdf

clean:
	$(RM) build/* pdf/*

.PHONY: all clean
