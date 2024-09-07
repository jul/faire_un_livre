#!/usr/bin/env bash
<< =cut

=head1 NAME

mkdoc.sh

=head2 SYNOPSIS

Generates the book. Requires pandoc and pdflatex for making the book

    ./mkdoc.sh

=cut



rm doc -rf

HAS_PANFLUTE=$( python -mpanflute 2>&1 | grep package > /dev/null )

if $HAS_PANFLUTE; then
    echo "has panflute"
else
    echo "CHECK virtualenv + pip install panflute"
fi
FILTER=""
if $HAS_PANFLUTE; then
    FILTER=" -F ../add_link_list.py "
fi
[ -d doc ] || mkdir -p doc/img
rm README.md
cp *md doc/
cd doc 
cat ../??_*.md  > index.md
pandoc -f gfm $FILTER  -s index.md -o ../index.pdf.md

rm *md
cat ../??_*.md  > ../index.pdf.md
cp ../pandoc.css .
cat ../titre_md ../index.pdf.md >> ./livre.md



#pandoc livre.md --toc $FILTER --pdf-engine=xelatex -V papersize=A4 -V documentclass=report --variable fontsize=12pt   -o mon_livre.pdf
pandoc livre.md -L ../bref.lua $FILTER --toc --pdf-engine=xelatex  -V papersize=A4 \
    -V documentclass=report   --variable fontsize=12pt \
    -V "mainfont:AtkinsonHyperlegible" \
    -V "mainfontoptions:Extension=.ttf, UprightFont=*-Regular, BoldFont=*-Bold,  ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic" \
    -so livre.pdf


pandoc livre.md -L ../bref.lua --toc --standalone -s -c pandoc.css  -o index.htm

rm ../index.*.md
if [ ! -z "$FILTER" ]; then
    pandoc  $( realpath  livre.md ) $FILTER -o ../README.md
else
    cp $( realpath ./livre.md ) `pwd`/../README.md
fi


