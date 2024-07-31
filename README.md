% Faire un livre
% jul
% 6 juillet 2024 $Version:fuveurien:$
---
header-includes: |
 \usepackage[french]{babel}
---

Introduction
============

Qui n'a jamais rêvé de pouvoir écrire des choses aux kilomètres
dans une console et se concentrer sur ce que l'on veut dire et
non où couper les mots, le nombre de caractères par lignes et avoir
une sortie chiadée ?

Jusqu'à présent la qualité «PAO» était réservé à des logiciels
forts dispendieux, mais, et si on pouvait écrire un livre avec ...
quasi rien (si on passe sous silence les 3Gbs d'installation de latex) ?

Comment je me débrouille à partir d'ici ?
- pour dupliquer ça chez moi
- comment je le fais fonctionner ?
- comment je le modifie ?

Le résultat généré devrait être ici [https://github.com/jul/faire_un_livre/blob/main/doc/mon_livre.pdf](https://github.com/jul/faire_un_livre/blob/main/doc/mon_livre.pdf)

# Pré-requis et clonage

Que vous soyez sous linux ou windows, mes outils favoris sont inclus quand
vous [installez git](https://git-scm.com/downloads). Surtout sous windows.

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
chaudement l'utilisation de [scoop](https://github.com/ScoopInstaller/Scoop)
ou [choco](https://chocolatey.org/install#individual)

D'ailleurs, j'incite tout le monde à se renseigner et/ou modifier ce texte
sur comment installer pandoc et pdflatex qui vont être nécessaires pour la suite.

Pour FreeBSD, il n'y a pas de package pdflatex il faut installer texlive et texformats : 
`pkg install texlive-texmf tex-formats tex-dvipsk`



# Génération

Normalement, vous avez bash et vous tapez simplement :

```
    ./mkdoc.sh
```

là dans le répertoire `doc` est apparu `./doc/mon_livre.pdf`

La magie s'opère ainsi

- les fichiers terminants par md sont tous mis dans l'ordre alphabético-numérique dans un gros fichier ;
- on leur adjoint un en-tête contenant le titre ;
- on leur adjoint la table des contenus automatiquement générée.

Il est possible d'ajouter des listes de tableaux et ou des illustrations.


# modifier

Le fichier `titre_md` contient ce qui permet de faire le titre

Le format des fichiers est en syntaxe « markdown » dont la syntaxe
est documentée ici : [https://docs.github.com/fr/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax](https://docs.github.com/fr/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

Les fichiers `xx_*md` sont les fichiers qui composent se livre.

Pour générer un livre, il suffit d'installer tout les logiciles nécessaires 
(tex, latex, pdflatex, pandoc) en plus de ceux que vous avez déjà, et ensuite
`./mkdoc.sh` vous générera la suite.



# Accessibilité

En sortant, l'autre jour, je suis tombé sur quelqu'un qui aurait bien
aimé lire, une épreuve faite avec ce gabarit, mais ... 
La fonte et sa taille n'aidait pas.

Je me dis que ce serait bien qu'en tant qu'informaticien, j'essaie d'aider
un peu donc j'ai fait mes recherche et j'ai rajouté une sortie avec une 
[fonte conçue par l'institut braille](https://brailleinstitute.org/freefont) pour faciliter la lecture pour les dys-voyants et mal-voyants.

Fonte qu'il va vous falloir télécharger et installer si vous voulez
générer le livre en format « lisible ».


# Versioner

La commande *versioner.sh* va introduire une chaîne aléatoire qui tente
d'être prononçable après la date sur la couverture.

Cela permet à ceux qui utilisent un gestionnaire de version comme moi
de pouvoir remonter dans le passer faire les corrections et envoyer un 
cout de *git rebase -i* pour propager les corrections faîtes sur une ancienne
version.

Le fichier history.txt donne le hash de la révision git correspondant au commit
précédent l'introduction de la version. Ça marque la révision qui vient d'être révolue.

# Références

- syntaxe bash [https://tldp.org/LDP/abs/html/](https://tldp.org/LDP/abs/html/)
- le site officiel de pandoc [https://pandoc.org/](https://pandoc.org/)
- la documentation markdown [https://docs.github.com/fr/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax](https://docs.github.com/fr/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
- le site où trouver ce livre et comment le fabriquer [https://github.com/jul/faire\_un\_livre](https://github.com/jul/faire_un_livre)
