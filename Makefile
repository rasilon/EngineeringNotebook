TARGET=notebook.pdf
CHAPTERS=$(wildcard chapters/*.tex)

all: book

clean:
	rm -f *.aux  *.log  *.pdf

book: ${TARGET}

${TARGET}: notebook.tex

notebook.tex: ${CHAPTERS}
	touch notebook.tex

%.pdf: %.tex
	xelatex $<
	cp -v $@ ${HOME}/public_html/


