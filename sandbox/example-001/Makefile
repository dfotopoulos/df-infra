all: svg png pdf

svg:
	dot -Tsvg diagrams/cloud.dot -o output/cloud.svg

png:
	dot -Tpng diagrams/cloud.dot -o output/cloud.png

pdf:
	dot -Tpdf diagrams/cloud.dot -o output/cloud.pdf

clean:
	rm -f output/cloud.svg output/cloud.png output/cloud.pdf
