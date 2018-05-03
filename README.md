# msc_markdown

The formatting style of this work is taken from [classicthesis](https://bitbucket.org/amiede/classicthesis/wiki/Home), changed for single page printing (see ```\documentclass``` in *template_classicthesis.tex*) and setup to write the body of the content in markdown rather than LaTeX using [pandoc](http://pandoc.org/). References are also added by pandoc if defined using pandoc's ```--bibliography=FILE``` option. Reference style is currently set to APA, but can be changed by downloading the appropriate CSL format from [here](https://github.com/citation-style-language/styles-distribution) and using it in pandoc's ```--csl=FILE``` option. These pandoc options can be adjusted in the *Makefile*, which is used to compile the file by basically calling a set pandoc command.

Pandoc converts all of the markdown documents into one chunk of LaTeX, ending with references, and inserts it into the custom LaTeX template, *template_classicthesis.tex*, at the pandoc variable ```$body$```. This template is also defined in the *Makefile* using pandoc's ```--template=FILE``` option. Some parameters (e.g. name, university, version, date) as used in the title page, and elsewhere in the document can be modified in *classicthesis-config.tex*.  All documents to be added before or after the body must be in .tex format. If you want to write these in markdown, either convert them to .tex separately using pandoc and put them in the approproate folders, or leave them in markdown and put them in the source folder with an appropriate name to be in the proper order (e.g. use a numbered prefix).

Adjust the *Makefile* according to your needs (i.e. additional before or after .tex documents --- all markdown files in the source folder are automatically included using a wildcard). Other options (HTML, etc.) will be added to the *Makefile* in the future.


## Linux/MacOS

Assuming you have "make" installed...

Using whatever shell you prefer, ```cd``` to the folder with the *Makefile* and  run the following command to compile a PDF:

```make pdf```

If fonts are giving you errors, complete the following command:

```initexmf --admin --mkmaps```


## Windows

For Windows-users, you can use Cygwin or whatever GNU shell of your likeing. Git bash is what I use since it is a pre-configured MinGW installation. To install "make" for git bash do the following:

- Go to ezwinports, <https://sourceforge.net/projects/ezwinports/files/>
- Download `make-4.1-2-without-guile-w32-bin.zip` (get the version without guile)
- Extract zip
- Copy the contents to `C:\Program Files\Git\mingw64\` merging the folders, but do NOT overwrite/replace any exisiting files.

In git bash, cd to the folder with the *Makefile* and run the following command to compile a PDF:

```make pdf```

If fonts are giving you errors, complete the following command:

```initexmf --admin --mkmaps```

