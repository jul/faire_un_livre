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
cp *md doc/
cd doc 
cat ../??_*.md  > index.md
pandoc -f gfm  -s index.md -o ../index.pdf.md
pandoc -f gfm  -s --toc index.md -o ../index.html.md

rm *md
cat ../titre_md ../index.pdf.md >> ./livre.md


pandoc ../index.html.md -o "index.html"
pandoc livre.md --toc -V documentclass=report -V mainfont="Bookman" --variable sansfont="Helvetica" --variable monofont="Menlo" --variable fontsize=12pt   -o mon_livre.pdf

rm ../index.*.md
rm ../README.md

ln -s index.md ../README.md

