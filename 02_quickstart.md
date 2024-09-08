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


Note : que ce soit *choco, scoop (windows), pkg (debian) ou apt (BSD)* on
installe les logiciels libres en faisant `installer install nom_du paquet` et
oui installer latex sur windows peut se faire avec ` choco install xetex `.


Pour FreeBSD, il n'y a pas de package pdflatex il faut installer texlive et texformats : 
`pkg install texlive-texmf tex-formats tex-dvipsk`

## Logiciels requis et optionnels


Le fichier qui fait la magie d'assembler le texte est  `mkdoc.sh` il aggrège les
fichiers XX_whatever.md ou XX est un chiffre dans l'ordre et il en fait un livre
en utilisant `pandoc`.

Comme les autres logiciels il peut être installé avec `choco install pandoc`.

[Le logiciel pandoc a un site clair mais ... en anglais](http://pandoc.org)

[J'ai pu trouvé un cours pas dégueu (il semble avoir été donné à l'EPFL) sur le
sujet de pandoc et markdown](https://www.jdbonjour.ch/cours/markdown-pandoc/)

Normalement, lua (un langage de programmation fort agréable) est normalement
installé comme dépendance de *pandoc* et sert à faire des filtres.

Python est en dépendance optionnelle pour faire des filtres avancés (le
générateur de la liste des liens en fin de document) et la génération de
versions. *mkdoc.sh* s'en passe très
bien. Par contre lui tourne sur bash, donc ... on revient à la case intiale :
installez git client qui a 90% des dépendances nécessaires à utiliser le code
source nécessaire à générer le livre.

## Conseil pour l'édition

Utilisez un éditeur qui est capable de forcer les retours à la ligne à 80
colonnes. J'ai vim mon vimrc pour contient : 

~~~
augroup myformatting
    autocmd Filetype markdown set tw=80
    autocmd BufEnter *md normal ggG<CR>
augroup END
~~~




