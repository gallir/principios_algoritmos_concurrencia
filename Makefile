SOURCES=$(chapters/*.asc)
BASE=concurrencia
MAIN=$(BASE).asc

UNIFIED_BASE=unified_$(BASE)
UNIFIED=unified_$(MAIN)
EPUB_SPINE=epub_spine.asc

all: mobi epub html

$(UNIFIED): $(MAIN) $(SOURCES)
	./unify.py $<  $@

$(EPUB_SPINE): $(UNIFIED)
	./epub_spine.py $<  $@

mobi: output/$(UNIFIED_BASE).mobi 

epub: output/$(UNIFIED_BASE).epub

html: output/$(UNIFIED_BASE).html

output/$(UNIFIED_BASE).mobi: $(UNIFIED) $(EPUB_SPINE)
	asciidoctor-epub3 -a ebook-format=kf8 $(EPUB_SPINE) -o $@
	#-kindlegen output/$(UNIFIED_BASE).epub

output/$(UNIFIED_BASE).epub: $(UNIFIED) $(EPUB_SPINE)
	asciidoctor-epub3 $(EPUB_SPINE) -o $@ 
	#a2x -f epub $(UNIFIED) -D output

output/$(UNIFIED_BASE).html: $(UNIFIED)
	asciidoctor $(UNIFIED) -o $@

.PHONY: clean
clean:
	-rm output/* $(UNIFIED) $(EPUB_SPINE)
