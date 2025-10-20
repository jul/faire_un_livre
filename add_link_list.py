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
        item =  DefinitionItem( [ Link(Str(""),Str(_def))], [Definition(Plain(Str(f"{stringify(elem.content)}")))], )
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


