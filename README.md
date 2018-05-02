# msc_markdown

The formatting of this work is based on the classicthesis style, changed for single page printing and setup to write the body of the content in markdown rather than latex. References are also added by pandoc.

For Windows-users who have git bash, install "make" for git bash by:

- Go to ezwinports, <https://sourceforge.net/projects/ezwinports/files/>
- Download `make-4.1-2-without-guile-w32-bin.zip` (get the version without guile)
- Extract zip
- Copy the contents to `C:\Program Files\Git\mingw64\` merging the folders, but do NOT overwrite/replace any exisiting files.

In git bash, cd to the folder with the make file and

'''make pdf'''

If fonts are giving you errors, complete the following command:

'''initexmf --admin --mkmaps'''
