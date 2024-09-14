[ -z "$1" ] && { echo give the pdf source that must be printed as a booklet; exit 1 ; }
pdftops "$1" sortie.ps
psbook -s 16 < sortie.ps | psnup -pa4 -Pa4 -2 | pstops 2:0 > pair.ps &> /dev/null || echo "KO"
psbook -s 16 < sortie.ps | psnup -pa4 -Pa4 -2 | pstops 2:-1 > impair.ps &> /dev/null || echo "KOO"


ps2pdf pair.ps 1> /dev/null
ps2pdf impair.ps 1> /dev/null

echo "Imprimer d'abord pair.pdf, puis impair.pdf sur les mêmes feuilles que vous aurez
bien positionnées"

