[ -z "$1" ] && { echo give the pdf source that must be printed as a booklet; exit 1 ; }
pdftops "$1" sortie.ps
psbook -s 16 < sortie.ps | psnup -pa4 -Pa4 -2 | pstops 2:0 > pair.ps 
psbook -s 16 < sortie.ps | psnup -pa4 -Pa4 -2 | pstops 2:-1 > impair.ps


ps2pdf pair.ps 
ps2pdf impair.ps

echo "Imprimer d'abord pair.pdf, puis impair.pdf sur les mêmes feuilles que vous aurez
bien positionnées"

