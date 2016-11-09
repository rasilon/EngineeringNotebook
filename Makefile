TARGET=notebook.pdf
CHAPTERS=$(wildcard chapters/*.tex)

all: book

remake:
	xelatex -halt-on-error notebook.tex
	xelatex -halt-on-error notebook.tex
	cp -v *.pdf ${HOME}/public_html/

fullclean: clean
	rm -f *.aux *.toc chapters/*.aux
clean:
	rm -f ${TARGET} *.log

book: ${TARGET}

${TARGET}: notebook.tex notebook.xmpdata

notebook.tex: ${CHAPTERS}
	touch notebook.tex

%.pdf: %.tex
	xelatex -halt-on-error $<
	xelatex -halt-on-error $<
	cp -v $@ ${HOME}/public_html/


