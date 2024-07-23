#!/usr/bin/env bash
<< =cut

=head1 NAME

mkdoc.sh

=head2 SYNOPSIS

Generates the book. Requires pandoc and pdflatex for making the book

    ./mkdoc.sh

=cut
rm doc -rf
[ -d doc ] || mkdir -p doc/img
rm README.md
cp *md doc/
cd doc 
cat ../??_*.md  > index.md
pandoc -f gfm  -s index.md -o ../index.pdf.md

rm *md
cat ../??_*.md  > ../index.pdf.md
cp ../pandoc.css .
cat ../titre_md ../index.pdf.md >> ./livre.md


pandoc livre.md --toc -V --pdf-engine=xelatex -V papersize=A4 -V documentclass=report -V mainfont="Bookman" --variable sansfont="Helvetica" --variable monofont="Menlo" --variable fontsize=12pt   -o mon_livre.pdf
pandoc livre.md --toc --standalone -s -c pandoc.css  -o index.html

rm ../index.*.md
ln -s $( realpath ./livre.md ) `pwd`/../README.md


