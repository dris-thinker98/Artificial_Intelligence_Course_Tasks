# -*- coding: utf-8 -*-
"""
Program for AI Assignment 5 - NL Interface

@author: dedri
"""

import nltk
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
from pyswip import Prolog

#----------------------------QUESTION - 1-----------------------------

inplist = []
inp1 = input("Which field of Computer Science are you interested in? \n")
# inp1 = input("How are your grades in Mtech? (Average means 6-8 (excluding 8) and High means 8-10) \n")
# inp1 = input("What is your preference between projects or only courses? \n")
# print("\nWe have got ...", inp1)
tok1 = word_tokenize(inp1)
#print("\n\n...The tokens are ...", tok1)

ps = PorterStemmer()
for wod in tok1:
    #print("\n..word is..",wod)
    stem1 = ps.stem(wod)
    #print("...stem is ...", stem1)
    inplist.append(stem1)

#print("\n.. list is ", inplist)

f = open("elective_facts.txt", 'w')
if "field" in inplist:
    if "data" in inplist:
        f.write("field(data)\n")
    elif "softwar" in inplist:
        f.write("field(software)\n")
    elif "network" in inplist:
        f.write("field(networking)\n")
    else:
        f.write("field(any)\n")
        
#----------------------------QUESTION - 2-----------------------------

inp2 = input("How are your grades in Mtech? (Average means 6-8 (excluding 8) and High means 8-10) \n")
# inp1 = input("What is your preference between projects or only courses? \n")
# print("\nWe have got ...", inp1)
tok2 = word_tokenize(inp2)
#print("\n\n...The tokens are ...", tok2)

ps = PorterStemmer()
for wod in tok2:
    #print("\n..word is..",wod)
    stem2 = ps.stem(wod)
    #print("...stem is ...", stem2)
    inplist.append(stem2)

#print("\n.. list is ", inplist)

#f = open("elective_facts.txt", 'w')
if "grade" in inplist:
    if "averag" in inplist:
        f.write("grade(average)\n")
    elif "high" in inplist:
        f.write("grade(high)\n")
    else:
        f.write("grade(any)\n")
        
#----------------------------QUESTION - 3-----------------------------

inp3 = input("What is your preference between projects or only courses? \n")
# print("\nWe have got ...", inp1)
tok3 = word_tokenize(inp3)
#print("\n\n...The tokens are ...", tok3)

ps = PorterStemmer()
for wod in tok3:
    #print("\n..word is..",wod)
    stem3 = ps.stem(wod)
    #print("...stem is ...", stem3)
    inplist.append(stem3)

#print("\n.. list is ", inplist)

#f = open("elective_facts.txt", 'w')
if "prefer" in inplist:
    if "project" in inplist:
        f.write("preference(projects)\n")
    elif "cours" in inplist:
        f.write("preference(courses)\n")
    else:
        f.write("preference(any)\n")

f.close()

#---------------APPLYING PROLOG TO THIS PYTHON PROGRAM--------------

print('\n\n')
swipl = Prolog()
swipl.consult("elective_advisory.pl")
# print(list(swipl.query()))
with open('elective_facts.txt') as f:
    lines = f.readlines()
    for l in lines:
        #print(l)
        results = list(swipl.query(l))
        print(results)