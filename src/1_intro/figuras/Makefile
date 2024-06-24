.POSIX:

sources:=$(shell find -name '*.tex')
pdf = $(sources:./%.tex=build/%.pdf)
cropped = $(sources:./%.tex=pdf/%.pdf)

all: $(cropped)

$(cropped): pdf/%.pdf: build/%.pdf
	pdfcrop $< $@

$(pdf): build/%.pdf: %.tex | build pdf
	xelatex -output-directory=build $<

build:
	mkdir -p build

pdf:
	mkdir -p pdf

clean:
	$(RM) build/* pdf/*

.PHONY: all clean
