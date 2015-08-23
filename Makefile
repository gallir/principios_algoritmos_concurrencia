BASE=concurrencia
OUTDIR=output
SOURCES=$(wildcard $(BASE).adoc chapters/*.adoc)
MAIN=$(BASE).adoc
CSS=epub.css

RESOURCES=--resource styles/docbook-xsl.css
A2XOPTIONS=-v $(RESOURCES) --conf-file=resources/a2x.conf --stylesheet=styles/$(CSS)  --attribute tabsize=4

all: xml pdf

html: $(OUTDIR)/$(BASE).html

xml: $(OUTDIR)/$(BASE).xml

pdf: $(OUTDIR)/$(BASE).pdf

ps: $(OUTDIR)/$(BASE).ps

$(OUTDIR)/$(BASE).xml: $(SOURCES)
	asciidoctor -D $(OUTDIR) -b docbook -d book -a data-uri! $(MAIN)

$(OUTDIR)/$(BASE).ps: $(OUTDIR)/$(BASE).xml
	~/git/asciidoctor-fopub/fopub -f ps -t docbook-xsl/ $(OUTDIR)/$(BASE).xml

$(OUTDIR)/$(BASE).pdf: $(OUTDIR)/$(BASE).xml
	~/git/asciidoctor-fopub/fopub -t docbook-xsl/ $(OUTDIR)/$(BASE).xml

$(OUTDIR)/$(BASE).html: $(SOURCES)  styles/$(CSS)
    #asciidoctor $(MAIN) --attribute tabsize=4 -o $@
    ## Call original a2x to avoid icons
    #a2x -f xhtml $(A2XOPTIONS) -a icons -a admon.graphics -a callout.graphics -D $(OUTDIR) $(MAIN)
	scripts/a2x -f xhtml $(A2XOPTIONS) -D $(OUTDIR) $(MAIN)

.PHONY: clean
clean:
	-rm -rf output/*

print-%  : ; @echo $* = $($*)
