SOURCES=$(chapters/*.asc)
BASE=concurrencia
MAIN=$(BASE).asc

UNIFIED_BASE=unified_$(BASE)
UNIFIED=unified_$(MAIN)
EPUB_SPINE_BASE=epub_spine
EPUB_SPINE=$(EPUB_SPINE_BASE).asc

all: mobi epub html

$(UNIFIED): $(MAIN) $(SOURCES)
	./unify.py $<  $@

$(EPUB_SPINE): $(UNIFIED)
	./epub_spine.py $<  $@

mobi: output/$(EPUB_SPINE_BASE).mobi 

epub: output/$(EPUB_SPINE_BASE).epub

html: output/$(UNIFIED_BASE).html

output/$(EPUB_SPINE_BASE).mobi: $(UNIFIED) $(EPUB_SPINE)
	asciidoctor-epub3 -a ebook-format=kf8 $(EPUB_SPINE) -o $@ #-kindlegen output/$(UNIFIED_BASE).epub

output/$(EPUB_SPINE_BASE).epub: $(UNIFIED) $(EPUB_SPINE)
	asciidoctor-epub3 $(EPUB_SPINE) -o $@ #a2x -f epub $(UNIFIED) -D output 

output/$(UNIFIED_BASE).html: $(UNIFIED)
	asciidoctor $(UNIFIED) -o $@

.PHONY: clean
clean:
	-rm output/* $(UNIFIED) $(EPUB_SPINE)
