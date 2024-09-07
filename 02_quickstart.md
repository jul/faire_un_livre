# Pré-requis et clonage

[Que vous soyez sous linux ou windows, mes outils favoris sont inclus quand
vous installez le client git](https://git-scm.com/downloads). Surtout sous windows.

L'explorateur de fichier sous windows vous permet dorénavant de faire 
un click droit sur un dossier et de faire « git bash here », et vous allez faire
```
    git clone https://github.com/jul/faire_un_livre.git

```

et maintenant faîtes 
```
    cd faire_un_livre
```
Dans ce répertoire il y a un fichier : `02_quickstart` et bien ... c'est celui
que vous lisez en ce moment.

Pour les utilisateurs de windows qui vont avoir besoin de latex, je recommande
chaudement l'utilisation de [l'installeur en ligne de commande scoop pour
windows](https://github.com/ScoopInstaller/Scoop)
ou [l'installeur en ligne de commande choco pour windows ](https://chocolatey.org/install#individual)

D'ailleurs, j'incite tout le monde à se renseigner et/ou modifier ce texte
sur comment installer pandoc et pdflatex qui vont être nécessaires pour la suite.

Pour FreeBSD, il n'y a pas de package pdflatex il faut installer texlive et texformats : 
`pkg install texlive-texmf tex-formats tex-dvipsk`



