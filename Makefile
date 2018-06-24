PANDOC=pandoc

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
STYLEDIR=$(BASEDIR)/style
BEFOREDIR=$(INPUTDIR)/before
AFTERDIR=$(INPUTDIR)/after

BIBFILE=$(INPUTDIR)/references.bib

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make tex                         generate a tex file  			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
	@echo 'get local templates with: pandoc -D latex/html/etc	  				  '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates		  '

pdf:
	pandoc "$(INPUTDIR)"/*.md \
	-f markdown \
	-o "$(OUTPUTDIR)/thesis.pdf" \
	--template="$(STYLEDIR)/template_classicthesis.tex" \
	--include-before-body "$(BEFOREDIR)"/00_00_coverpage.tex \
	--include-before-body "$(BEFOREDIR)"/00_01_abstract.tex \
	--include-before-body "$(BEFOREDIR)"/00_02_statements.tex \
	--include-before-body "$(BEFOREDIR)"/00_03_acknowledgements.tex \
	--include-before-body "$(BEFOREDIR)"/00_04_toc.tex \
	--include-after-body "$(AFTERDIR)"/09_appendix.tex \
	--include-after-body "$(AFTERDIR)"/10_colophon.tex \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/apa.csl" \
	--verbose \
	--latex-engine=pdflatex

tex:
	pandoc "$(INPUTDIR)"/*.md \
	-f markdown \
	-o "$(OUTPUTDIR)/thesis.latex" \
	--template="$(STYLEDIR)/template_classicthesis.tex" \
	--include-before-body "$(BEFOREDIR)"/00_00_coverpage.tex \
	--include-before-body "$(BEFOREDIR)"/00_01_abstract.tex \
	--include-before-body "$(BEFOREDIR)"/00_02_statements.tex \
	--include-before-body "$(BEFOREDIR)"/00_03_acknowledgements.tex \
	--include-before-body "$(BEFOREDIR)"/00_04_toc.tex \
	--include-after-body "$(AFTERDIR)"/09_appendix.tex \
    --include-after-body "$(AFTERDIR)"/10_colophon.tex \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/apa.csl" \
	--verbose


.PHONY: help pdf tex
