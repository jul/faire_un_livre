#!/usr/bin/env python
from panflute import *

toc = None
def prepare(doc):
    global toc
    toc = DefinitionList()

def action(elem, doc):
    global toc
    if isinstance(elem, Link) and elem.url != stringify(elem.content):
        _def = elem.url
        item =  DefinitionItem( [ Str(_def)], [Definition(Plain(Str(f"{stringify(elem.content)}")))], )
        if True or "img" not in elem.url:
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


