BASE=master
OUTDIR=output
SOURCES=$(wildcard $(BASE).adoc chapters/*.adoc)
MAIN=$(BASE).adoc

CSS=epub.css
A2XOPTIONS= --conf-file=resources/a2x.conf --stylesheet=resources/$(CSS) -a docinfo --attribute tabsize=2 


all: mobi epub html

mobi: $(OUTDIR)/$(BASE).mobi

epub: $(OUTDIR)/$(BASE).epub

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
