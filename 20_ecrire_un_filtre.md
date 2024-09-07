# Pandoc et python

Alors, pourquoi ne pas utiliser l'excellent pandocfilters et panflute ?

Parce que panflute est plus idiomatiquement proche des filtres lua ou haskell
pour pandoc, et c'est un grand avantage, mais si pandocfilters est parfait pour
faire des filtres simples du type pourt tout élément faire un truc simple, pour
les choses qui nécessitent de modifier le document *genre pour rajouter un
index* c'est plus compliqué.

Or, en voulant faire un livre qui se voulait accessible, je me suis aperçu qu'en
PDF les liens n'étaient ni visibles, ni leurs URLs. Donc, comme un grand j'ai
décidé de coder mon propre filtre.

Deux choses aident :

- [la documentation de pandoc est claire quoique concise](https://pandoc.org/filters.html)
- [on trouve beaucoup de question réponses sur pandoc sur stackoverflow](https://stackoverflow.com/questions/tagged/pandoc?tab=Votes)


## Pandoc et lua

Lua est un langage de programmation clair assez basique avec lequel il est dur
de se tirer une balle dans le pied.

Sa syntaxe qui rappelle un peu pascal (function/if//end, et les index de tableau
à 1) n'est pas sans déplaire.

Un filtre lua simple est un filtre qui pour un type d'objet pandoc (tel
qu'exposé dans la sortie JSON) fait correspondre une manipulation simple.

### Cas d'étude : j'ai un tic de langage je dis « bref » tout le temps

Bref, je ne veux plus voir « bref » dans mes sorties !

le filtre lua suivant que l'on enregistra dans bref.lua :

```lua
function Str (el)
  if el.text:match 'Bref' then
    return "PROUT"
  end
end
```

Retourne PROUT à chaque fois qu'il voit « Bref » seul.

On l'appelle dans la chaîne de production avec 
``` pandoc --lua-filter bref.lua input.whatever -o output.peu_importe ```


### Filtre complexe (avec mémoire) rajouter une liste des liens


Le PDF c'est bien, c'est cliquable.

Mais, quand on imprime un PDF, les liens deviennent invisible ... si seulement
on pouvait rajouter une table de lien avec *panflute*.

[Panflute est un module python bien documenté pour faire des filtres
pandoc](https://scorreia.com/software/panflute/) et l'exemple qui suit est
dérivé directement du code d'exemple :

\newpage


```python
#!/usr/bin/env python
from panflute import *

toc = None
def prepare(doc):
    global toc
    toc = DefinitionList()

def action(elem, doc):
    global toc
    if isinstance(elem, Link):
        _def = elem.url
        item =  DefinitionItem([ 
            Str(_def)],
            Definition(
                Plain(
                    Str(
                        f"{stringify(elem.content)}"
            )))], )
        toc.content.insert(-1,item)

def finalize(doc):
    ttoc = Div(
        Header(Str("Liste des liens")),
        toc
    )
    doc.content+=  [ ttoc ]

def main(doc=None):
    return run_filter(action, prepare=prepare, finalize=finalize, doc=doc)


if __name__ == '__main__':
    main()
```
