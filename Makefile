BASE=concurrencia
OUTDIR=output
SOURCES=$(wildcard $(BASE).adoc chapters/*.adoc)
MAIN=$(BASE).adoc
CSS=epub.css

RESOURCES=--resource styles/docbook-xsl.css --resource styles/asciidoctor-default.css
A2XOPTIONS=$(RESOURCES) --conf-file=resources/a2x.conf --stylesheet=styles/$(CSS)  --attribute tabsize=4  


html: $(OUTDIR)/$(BASE).html 

epub: $(OUTDIR)/$(BASE).epub

redo: clean epub

all: clean epub mobi

mobi: $(OUTDIR)/$(BASE).mobi

validate: 
	asciidoctor-epub3 -D $(OUTDIR) -a ebook-validate $(MAIN)

$(OUTDIR)/$(BASE).mobi: $(SOURCES) $(OUTDIR)/$(BASE).epub styles/$(CSS)
	-kindlegen $(OUTDIR)/$(BASE).epub

$(OUTDIR)/$(BASE).epub: $(SOURCES)  styles/$(CSS)
	scripts/a2x -f epub $(A2XOPTIONS) -D $(OUTDIR) $(MAIN)

$(OUTDIR)/$(BASE).html: $(SOURCES)  styles/$(CSS)
	#asciidoctor $(MAIN) --attribute tabsize=4 -o $@
	## Call original a2x to avoid icons
	#a2x -f xhtml $(A2XOPTIONS) -a icons -a admon.graphics -a callout.graphics -D $(OUTDIR) $(MAIN)
	scripts/a2x -f xhtml $(A2XOPTIONS) -D $(OUTDIR) $(MAIN)

.PHONY: clean
clean:
	-rm -rf output/* 

print-%  : ; @echo $* = $($*)
