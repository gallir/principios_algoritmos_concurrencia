SOURCES=$(wildcard *.asc chapters/*.asc)
MAIN=concurrencia.asc

all: mobi epub

mobi: output/concurrencia.mobi

epub: output/concurrencia.epub

output/concurrencia.mobi: $(SOURCES)
	asciidoctor-epub3 -a ebook-format=kf8 $(MAIN) -o $@

output/concurrencia.epub: $(SOURCES)
	asciidoctor-epub3 $(MAIN) -o $@

clean:
	rm output/*
