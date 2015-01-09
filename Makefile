# Taken from https://github.com/kjhealy/pandoc-templates/blob/master/examples/Makefile

## Put this Makefile in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files (complete with bibliography, if present) from
## your markdown file. 
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf 
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this. 
## -	You can specify an output format with `make tex`, `make pdf` or 
## - 	`make html`. 
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files 
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!

SRC = thesis.md

## Location of Pandoc support files.
PREFIX = .

## Location of your working bibliography file
BIB = thesis.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = german

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)

all:	$(PDFS) $(HTML) $(TEX)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)

%.html:	%.md
	pandoc -r markdown+pipe_tables+table_captions+yaml_metadata_block+escaped_line_breaks+subscript \
		--to=html5 \
		--toc \
		--toc-depth=1 \
		--smart \
		--html-q-tags \
		--self-contained \
		--reference-links \
		--number-sections \
		--template=$(PREFIX)/templates/html.template \
		--css=$(PREFIX)/marked/kultiad-serif.css \
		--filter pandoc-citeproc \
		--csl=$(PREFIX)/csl/$(CSL).csl \
		--bibliography=$(BIB) \
		-o $@ $< chapters/*.md

%.tex: %.md
	pandoc -r markdown+pipe_tables+table_captions+yaml_metadata_block+escaped_line_breaks+subscript+definition_lists+compact_definition_lists \
        --filter ./rendertree.hs \
		--to=latex \
		--standalone \
		--toc \
		--toc-depth=1 \
		--chapters \
		--smart \
		--no-tex-ligatures \
		--latex-engine=xelatex \
		--template=$(PREFIX)/templates/latex.template \
		--filter pandoc-citeproc \
		--csl=$(PREFIX)/csl/$(CSL).csl \
		--bibliography=$(BIB) \
		-o $@ $< chapters/*.md

%.pdf: %.md
	pandoc -r markdown+pipe_tables+table_captions+yaml_metadata_block+escaped_line_breaks+subscript+definition_lists+compact_definition_lists \
        --filter ./rendertree.hs \
		--standalone \
		--toc \
		--toc-depth=1 \
		--chapters \
		--smart \
		--no-tex-ligatures \
		--latex-engine=xelatex \
		--template=$(PREFIX)/templates/latex.template \
		--filter pandoc-citeproc \
		--csl=$(PREFIX)/csl/$(CSL).csl \
		--bibliography=$(BIB) \
		-o $@ $< chapters/*.md

clean:
	rm -f *.html *.pdf *.tex
