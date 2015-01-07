BASE=master
OUTDIR=output
SOURCES=$(wildcard $(BASE).adoc chapters/*.adoc)
MAIN=$(BASE).adoc
CSS=epub.css

RESOURCES=--resource styles/docbook-xsl.css --resource styles/asciidoctor-default.css
A2XOPTIONS=$(RESOURCES) --conf-file=resources/a2x.conf --stylesheet=styles/$(CSS)  --attribute tabsize=4  


epub: $(OUTDIR)/$(BASE).epub

redo: clean epub

all: clean epub mobi

mobi: $(OUTDIR)/$(BASE).mobi


html: $(OUTDIR)/$(BASE).html

validate: 
	asciidoctor-epub3 -D $(OUTDIR) -a ebook-validate $(MAIN)

$(OUTDIR)/$(BASE).mobi: $(SOURCES) $(OUTDIR)/$(BASE).epub 
	-kindlegen $(OUTDIR)/$(BASE).epub

$(OUTDIR)/$(BASE).epub: $(SOURCES)
	scripts/a2x -f epub $(A2XOPTIONS) -D $(OUTDIR) $(MAIN)

$(OUTDIR)/$(BASE).html: $(SOURCES)
	asciidoctor $(MAIN) -o $@
	#a2x -f xhtml $(A2XOPTIONS) -D $(OUTDIR) $(MAIN)

.PHONY: clean
clean:
	-rm -rf output/* 

print-%  : ; @echo $* = $($*)
