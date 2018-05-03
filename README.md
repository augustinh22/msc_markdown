# msc_markdown

The formatting of this work is based on the classicthesis style, changed for single page printing and setup to write the body of the content in markdown rather than latex using pandoc. References are also added by pandoc. Pandoc converts all of the markdown documents into one chunk of latex, ending with references, and inserts it into the latex template (template_classicthesis.tex) at the pandoc variable $body$. All documents to be added before or after must be in .tex. If you want to write these in markdown, either convert them to .tex separately using pandoc and put them in the approproate folders, or leave them in markdown and put them in the source folder with an appropriate name to be in the proper order.

Adjust the Makefile accordingly (i.e. additional before or after .tex documents --- all markdown files in the source folder are automatically included using a wildcard).


## Linux/MacOS

Assuming you have "make" installed:

cd to the folder with the make file and

'''make pdf'''

If fonts are giving you errors, complete the following command:

'''initexmf --admin --mkmaps'''


## Windows

For Windows-users who have git bash, install "make" for git bash by:

- Go to ezwinports, <https://sourceforge.net/projects/ezwinports/files/>
- Download `make-4.1-2-without-guile-w32-bin.zip` (get the version without guile)
- Extract zip
- Copy the contents to `C:\Program Files\Git\mingw64\` merging the folders, but do NOT overwrite/replace any exisiting files.

In git bash, cd to the folder with the make file and

'''make pdf'''

If fonts are giving you errors, complete the following command:

'''initexmf --admin --mkmaps'''
