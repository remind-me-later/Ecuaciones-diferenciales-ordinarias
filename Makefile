.POSIX:

name=elementos_de_ecuaciones_diferenciales_ordinarias
sources:=$(shell find src -maxdepth 2 -name '*.tex')
style:=$(shell find sty -name '*.sty')
makefiles:=$(shell find . -mindepth 1 -maxdepth 4 -type f -name Makefile)
subdir:=$(filter-out ./,$(dir $(makefiles)))

OUTDIR=build

all: $(OUTDIR)/$(name).pdf

figures:
	for dir in $(subdir); do \
		make -C $$dir all; \
	done

$(OUTDIR)/$(name).pdf: $(sources) $(style) | figures $(OUTDIR)
	latexmk -xelatex -output-directory=../$(OUTDIR) -cd -silent

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	for dir in $(subdir); do \
		make -C $$dir clean; \
	done
	$(RM) -r $(OUTDIR)

cle:
	$(RM) -r $(OUTDIR)

.PHONY: all clean cle
