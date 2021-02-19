.POSIX:

all: edo.pdf

edo.pdf: edo.tex | build
	xelatex --output-directory=build edo.tex
	mv build/edo.pdf .

build:
	mkdir -p build

clean:
	$(RM) build/* edo.pdf

.PHONY: all clean
