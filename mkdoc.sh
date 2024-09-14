#!/usr/bin/env bash
<< =cut

=head1 NAME

mkdoc.sh

=head2 SYNOPSIS

Generates the book. Requires pandoc and pdflatex for making the book

    ./mkdoc.sh

=cut



rm doc -rf

FILTER=
which python &> /dev/null && FILTER=" -F ../add_link_list.py "
if [ -z "$FILTER" ] ; then
        echo "python installed?"
        echo "CHECK virtualenv + pip install panflute"
fi
[ -d doc ] || mkdir -p doc/img
rm README.md
cp *md doc/
cp -r img doc
cd doc 
cat ../??_*.md  > index.md
pandoc -f gfm $FILTER  -s index.md -o ../index.pdf.md

rm *md
cat ../??_*.md  > ../index.pdf.md
cp ../pandoc.css .
cat ../titre_md ../index.pdf.md >> ./livre.md


pandoc livre.md -L ../bref.lua $FILTER --toc --pdf-engine=xelatex  -V papersize=A4 \
    -V documentclass=report   --variable fontsize=12pt \
    -V "mainfont:AtkinsonHyperlegible" \
    -V "mainfontoptions:UprightFont=*-Regular, BoldFont=*-Bold,  ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic" \
    -so livre.pdf

pandoc livre.md -L ../bref.lua $FILTER --toc --pdf-engine=xelatex  -V papersize=A4 \
    -V documentclass=extbook  --variable fontsize=17pt \
    -V "mainfont:AtkinsonHyperlegible" \
    -V "mainfontoptions:UprightFont=*-Regular, BoldFont=*-Bold,  ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic" \
    -so livre_A5_pre.pdf


pandoc livre.md -L ../bref.lua --toc --standalone -s -c pandoc.css  -o index.html

../mkbooklet.sh livre_A5_pre.pdf


rm ../index.*.md
if [ ! -z "$FILTER" ]; then
    pandoc -L ../bref.lua $( realpath  livre.md ) $FILTER -o ../README.md
else
    cp $( realpath ./livre.md ) `pwd`/../README.md
fi


