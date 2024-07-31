#!/usr/bin/env python
# -*- coding: utf-8 -*-


# wtfpl 2.0 github:jul
# source https://gist.github.com/jul/85fd7344a1e77975c641
"""
For remote generation with local seed smoke.txt and genpass.py as the local file:

curl https://gist.githubusercontent.com/jul/85fd7344a1e77975c641/raw/43f839c043c767cbd5f7d987a58b6a364a38594c/gen_gen_pass.py
|  colour="smoke.txt" dst="genpass.py" python -i

try
> gen_pass(8)
'donavan'
"""

TRANS = {
    "_": {
        "o": 1,
        "total": 185,
        "g": 5,
        "t": 23,
        "y": 1,
        "a": 4,
        "s": 23,
        "m": 8,
        "r": 15,
        "v": 6,
        "p": 20,
        "L": 6,
        "e": 4,
        "c": 14,
        "q": 7,
        "b": 17,
        "n": 4,
        "h": 12,
        "i": 3,
        "f": 6,
        "d": 5,
        "j": 1
    },
    "o": {
        "u": 12,
        "total": 54,
        "i": 5,
        "q": 1,
        "d": 1,
        "n": 25,
        "s": 6,
        "L": 2,
        "e": 2
    },
    "u": {
        "v": 2,
        "total": 71,
        "x": 7,
        "t": 5,
        "r": 22,
        "e": 11,
        "y": 2,
        "i": 9,
        "p": 2,
        "a": 1,
        "L": 3,
        "s": 3,
        "u": 2,
        "n": 2
    },
    "v": {
        "r": 2,
        "total": 11,
        "i": 3,
        "e": 4,
        "o": 1,
        "a": 1
    },
    "r": {
        "e": 33,
        "total": 64,
        "a": 15,
        "d": 2,
        "r": 3,
        "i": 6,
        "o": 3,
        "L": 1,
        "s": 1
    },
    "__": {
        "e": 36,
        "total": 185,
        "d": 2,
        "s": 44,
        "x": 7,
        "r": 23,
        "i": 7,
        "t": 28,
        "y": 2,
        "a": 2,
        "n": 30,
        "c": 3,
        "u": 1
    },
    "g": {
        "r": 2,
        "total": 10,
        "a": 2,
        "u": 4,
        "o": 1,
        "i": 1
    },
    "a": {
        "n": 6,
        "total": 72,
        "u": 3,
        "t": 5,
        "r": 4,
        "s": 16,
        "i": 24,
        "L": 13,
        "v": 1
    },
    "n": {
        "d": 7,
        "total": 29,
        "a": 2,
        "t": 7,
        "e": 5,
        "i": 1,
        "c": 2,
        "s": 3,
        "f": 1,
        "u": 1
    },
    "t": {
        "e": 6,
        "total": 37,
        "o": 12,
        "a": 9,
        "r": 4,
        "i": 4,
        "u": 2
    },
    "e": {
        "s": 28,
        "total": 98,
        "u": 24,
        "g": 5,
        "m": 3,
        "r": 14,
        "L": 1,
        "n": 16,
        "t": 2,
        "i": 1,
        "f": 1,
        "p": 1,
        "v": 1,
        "c": 1
    },
    "y": {
        "e": 1,
        "total": 3,
        "n": 2
    },
    "s": {
        "y": 2,
        "total": 64,
        "e": 14,
        "s": 9,
        "o": 10,
        "t": 14,
        "a": 12,
        "u": 3
    },
    "d": {
        "i": 2,
        "total": 13,
        "e": 6,
        "a": 2,
        "s": 1,
        "o": 1,
        "r": 1
    },
    "i": {
        "c": 4,
        "total": 67,
        "n": 4,
        "v": 1,
        "e": 13,
        "s": 10,
        "t": 9,
        "r": 15,
        "f": 1,
        "L": 3,
        "q": 3,
        "o": 2,
        "m": 2
    },
    "c": {
        "a": 2,
        "total": 18,
        "e": 10,
        "o": 4,
        "s": 1,
        "h": 1
    },
    "m": {
        "o": 4,
        "total": 13,
        "p": 2,
        "i": 1,
        "e": 4,
        "a": 2
    },
    "q": {
        "u": 11,
        "total": 11
    },
    "p": {
        "L": 3,
        "total": 25,
        "a": 6,
        "o": 4,
        "s": 3,
        "e": 5,
        "r": 3,
        "i": 1
    },
    "L": {
        "i": 5,
        "total": 33,
        "e": 9,
        "u": 3,
        "a": 12,
        "s": 3,
        "o": 1
    },
    "b": {
        "a": 2,
        "total": 17,
        "o": 7,
        "i": 8
    },
    "h": {
        "u": 6,
        "total": 13,
        "e": 6,
        "a": 1
    },
    "f": {
        "s": 1,
        "total": 9,
        "o": 2,
        "e": 1,
        "r": 2,
        "a": 1,
        "L": 1,
        "u": 1
    },
    "j": {
        "o": 1,
        "total": 1
    }
}

from random import randint
import string

def choose(letter):
    root = TRANS.get(letter, {})
    if not(len(root.keys())):
        return None
    if "total" not in root:
        raise KeyError("where is my total")
    acc=0
    _break = randint(0,root["total"])
    assert root["total"] >= _break, "hum something is wrong"

    next = None
    for next, weight in root.items():
        if  next != "total" and '_' not in next:
            acc+= root[next]
            if acc >= _break:
                return next
    return next

def gen_pass(size):
    word = choose("_")
    while(not word or len(word)<=size ):
        next = choose( (word and 0 < len(word)) and word[-1] or "_")
        if not(next) or word and next == word[-1]:
            #backtracking, no future in this transition
            word = word and word[:-1] or ""
        else:
            word += next
    return word

print(gen_pass(8))

