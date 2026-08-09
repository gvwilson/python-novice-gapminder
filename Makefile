.PHONY: commands html pdf clean

## commands: show available commands
commands:
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' | column -t -s ':'

## html: generate HTML in ./docs
html:
	quarto render --to html

## pdf: generate PDF
pdf:
	quarto render --to pdf

## clean: clean up build artifacts
clean:
	rm -f *.tex
