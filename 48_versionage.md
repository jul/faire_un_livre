# Versioner

La commande *versioner.sh* va introduire une chaîne aléatoire qui tente
d'être prononçable après la date sur la couverture.

Cela permet à ceux qui utilisent un gestionnaire de version comme moi
de pouvoir remonter dans le passer faire les corrections et envoyer un 
cout de *git rebase -i* pour propager les corrections faîtes sur une ancienne
version.

Le fichier history.txt donne le hash de la révision git correspondant au commit
précédent l'introduction de la version. Ça marque la révision qui vient d'être révolue.

