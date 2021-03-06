#!/bin/bash

# Copyright (c) François Dorval fdorval@hotmail.com and the Grit Game Engine project 2016 
# Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php

# Generate Documentations from xml/*.xml
# sudo apt-get install htmldoc python python-pip markdown
# pip install pygments

# Convert xml/*.xml to md/*.md (for README.md ) and generate single file html/complete.md
# Convert xml/*.xml to html/*.html (for Web Site) and generate single file html/complete.html
# Convert md/.md to md_html/*.html (test)
# Convert html/complete.html to pdf/gritbook.pdf 

python2 convert_web.py

mkdir -p md_html

for FILENAME in md/*.md
do
   HTML="${FILENAME##*/}"  # remove path and replace .md with .html
   HTML="./md_html/${HTML%.md}.html"
   echo "Convert $FILENAME into $HTML"
   markdown "$FILENAME" >"$HTML" 
done

cp html/*.png md_html


cd html
htmldoc --right 1.75cm --no-compression --headfootsize 9.0 --headfootfont courier --titleimage ../pdf/titleimage.png --logo ../pdf/logo.png --header ".l." --footer ".t1" -f ../pdf/gritbook.pdf complete.html
cd ..

# other tests
# wkhtmltopdf html/complete.html ../pdf/wk.pdf


