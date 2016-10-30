.PHONY: all
all: hot-load-code.pdf

%.pdf: src/tex/%.tex src/tex/references.bib
	@make -C src/tex $@
	@cp src/tex/$@ .

.PHONY: clean
clean:
	@make -C src/tex $@
	@rm -f hot-load-code.pdf
