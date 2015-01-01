BASE=concurrencia
OUTDIR=output
SOURCES=$(wildcard chapters/*.asc)
MAIN=$(BASE).asc


all: mobi epub html

mobi: $(OUTDIR)/$(BASE).mobi

epub: $(OUTDIR)/$(BASE).epub

html: $(OUTDIR)/$(BASE).html

validate: 
	asciidoctor-epub3 -D $(OUTDIR) -a ebook-validate $(MAIN)

$(OUTDIR)/$(BASE).mobi: $(OUTDIR)/$(BASE).epub
	-kindlegen $(OUTDIR)/$(BASE).epub

			#--stylesheet=resources/docbook-xsl.css --stylesheet=resources/epub.css 
$(OUTDIR)/$(BASE).epub: $(MAIN) $(SOURCES)
	a2x -f epub --conf-file=resources/a2x.conf \
			--stylesheet=resources/epub.css \
			-a docinfo --attribute tabsize=2 \
			-D $(OUTDIR) $(MAIN)

$(OUTDIR)/$(BASE).html: $(MAIN) $(SOURCES)
	asciidoctor $(MAIN) -o $@

.PHONY: clean
clean:
	-rm -rf output/* 
