#########################
# Tutorials on Makefile #
#########################

# http://www.gnu.org/software/make/manual/make.html
# http://nuclear.mutantstargoat.com/articles/make/

###########################
# Makefile global options #
###########################

MAKEFLAGS:= -j
# Maximize parallel execution whenever possible
OPTIONSPANDOC:= --toc --filter pandoc-numbering --filter pandoc-citeproc --filter pandoc-include-code --top-level-division=chapter -M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" --lua-filter filters/default-code-class.lua -M default-code-class=sqlmysql
# Options common to all invokations of pandoc. Cf https://pandoc.org/MANUAL.html to understand them.
# Option
# --indented-code-classes=.sqlmysql,.numberLines 
# works only for indented code, not fenced one (i.e., ~~~ or ``` are not impacted).
.DEFAULT_GOAL:= all
# By default, we construct all the files.
FIG_FOLDER = fig/*/
# Folder where source code for figures are present.
FIG_SOURCE = $(FIG_FOLDER)*.tex
# Source code for figures
FIG_PDF = $(FIG_FOLDER)*.pdf
# Figures in pdf format
JAVA_CODE = code/java/*.java


#########
# Rules #
#########

# "Phony" rule to compile the figures into pdf using latexmk
# This must be run before compiling the pdf.

.PHONY: fig $(FIG_SOURCE)
fig : $(FIG_SOURCE)
$(FIG_SOURCE):
	latexmk -silent -cd -pdf $@
# latexmk automates and simplifies the latex compilation of the figures.
	
# "Phony" rule to convert the pdf figures to svg (for better integration in htm and odt output).
# This must be run before compiling the odt or html.

.PHONY: fig_svg $(FIG_PDF)
fig_svg: $(FIG_PDF)
$(FIG_PDF): $(FIG_SOURCE)
# $(FIG_SOURCE) is an "order-only" pre-requisite. Cf. http://www.gnu.org/software/make/manual/make.html#Types-of-Prerequisites
# This means that we force fig to be executed before executing fig_svg
	pdf2svg $@ $(addsuffix .svg,$(basename $@))
# To understand this syntax, cf. https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html#File-Name-Functions

# Rule to compile to html

html: lectures_notes.md
	pandoc $(OPTIONSPANDOC) --css=style/style.css --toc-depth=1 --self-contained --default-image-extension=svg -o lectures_notes.html $<


# Rule to compile to odt

odt: lectures_notes.md
	pandoc  $(OPTIONSPANDOC) --default-image-extension=svg -o lectures_notes.odt $<


# Rule to compile to pdf

pdf: lectures_notes.md
	pandoc $(OPTIONSPANDOC) --pdf-engine=xelatex --pdf-engine-opt=-shell-escape -V links-as-notes --default-image-extension=pdf -o lectures_notes.pdf $<


# Rule to compile to mediawiki

mediawiki: lectures_notes.md
	pandoc $(OPTIONSPANDOC) --default-image-extension=svg --to mediawiki -o lectures_notes.mw $<


# Rule to compile a temporary file, for testing purposes

temp: temp.md
	pandoc $(OPTIONSPANDOC) --default-image-extension=svg --css=style/style.css --toc-depth=1 --self-contained -o temp.html $<
	pandoc $(OPTIONSPANDOC) --default-image-extension=svg -o temp.odt $<
	pandoc $(OPTIONSPANDOC) --pdf-engine=xelatex --pdf-engine-opt=-shell-escape -V links-as-notes --default-image-extension=pdf -o temp.pdf $<



# Rule to compile the readme file.

readme: ../README.md
	pandoc ../README.md -s -M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" -o ../README.html
	
contrib: ../CONTRIB.md
	pandoc ../CONTRIB.md -s --filter pandoc-citeproc -M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" -o ../CONTRIB.html

bug: ../KNOWN_BUGS.md
	pandoc ../KNOWN_BUGS.md -s -M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" -o ../KNOWN_BUGS.html

license: ../LICENSE.md
	pandoc ../LICENSE.md -s -M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" -o ../LICENSE.html

# "Phony" rule to compile all three versions (html, odt, pdf) of the document, the readme, the contrib, the licence and the known_bugs documents.

.PHONY: all
all: pdf odt html readme contrib bug license

# "Phony" rule to publish the compiled lecture notes, the README and other similar sites to the website.

.PHONY: push
push: 
	cp lectures_notes.pdf ~/travail/upload/site/spots/db/ln/CSCI_3410_lecture_notes.pdf
	cp lectures_notes.html ~/travail/upload/site/spots/db/ln/CSCI_3410_lecture_notes.html
	cp lectures_notes.odt ~/travail/upload/site/spots/db/ln/CSCI_3410_lecture_notes.odt
	cp ../README.html ~/travail/upload/site/spots/db/ln/README.html
	cp ../CONTRIB.html ~/travail/upload/site/spots/db/ln/CONTRIB.html
	cp ../KNOWN_BUGS.html ~/travail/upload/site/spots/db/ln/KNOWN_BUGS.html
	cp ../LICENSE.html ~/travail/upload/site/spots/db/ln/LICENSE.html

# "Phony" rule to remove the temporary files.

.PHONY: clean
clean: 
	rm -f lectures_notes.pdf  lectures_notes.odt lectures_notes.html
	rm -f temp.html temp.pdf temp.odt
	rm -f ../README.html
	find fig/*/ -type f -not -name '*.tex' -and -not -name '*.def'  -and -not -name '*.sty' -delete
# Every file that does not have the extension .tex or the extension .def is removed from all the folders in fig.

# "Phony" rule to indent properly the latex files
#.PHONY: clean_latex $(FIG_SOURCE)
#clean_latex: $(FIG_SOURCE)
#$(FIG_SOURCE):
#	latexindent -w -s $@
# git clean -ni

# "Phony" rule to beautify the java code
.PHONY: clean_java $(JAVA_CODE)
clean_java: $(JAVA_CODE)
$(JAVA_CODE):
	java -jar lib/google-java-format-1.7-all-deps.jar -i $@
