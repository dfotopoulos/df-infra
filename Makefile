.PHONY: all diagrams svg png pdf clean npm-script format format-check format-yml format-yml-check format-json format-json-check format-md format-md-check format-files format-files-check

NPM ?= npm
FORMAT_FILES ?=
SCRIPT ?=

all: diagrams

diagrams: svg png pdf

output:
	mkdir output

svg: output/vps.svg

png: output/vps.png

pdf: output/vps.pdf

output/vps.svg: diagrams/vps.dot | output
	dot -Tsvg diagrams/vps.dot -o output/vps.svg

output/vps.png: diagrams/vps.dot | output
	dot -Tpng diagrams/vps.dot -o output/vps.png

output/vps.pdf: diagrams/vps.dot | output
	dot -Tpdf diagrams/vps.dot -o output/vps.pdf

npm-script:
	$(NPM) run $(SCRIPT)

format:
	$(NPM) run format

format-check:
	$(NPM) run format:check

format-yml:
	$(NPM) run format:yml

format-yml-check:
	$(NPM) run format:yml:check

format-json:
	$(NPM) run format:json

format-json-check:
	$(NPM) run format:json:check

format-md:
	$(NPM) run format:md

format-md-check:
	$(NPM) run format:md:check

format-files:
	$(NPM) run format:files -- $(FORMAT_FILES)

format-files-check:
	$(NPM) run format:files:check -- $(FORMAT_FILES)

ifeq ($(OS),Windows_NT)
clean:
	powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Force -ErrorAction SilentlyContinue output/vps.*"
else
clean:
	rm -f output/vps.svg output/vps.png output/vps.pdf
endif