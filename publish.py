#!/usr/bin/env python3
import sys, os
from os import path
from setconfig import setconfig
from datetime import date

def thefiles(filepath):
  dirpath, filename = path.split(filepath)
  pubpath = path.join(dirpath, 'publish')
  with open(pubpath, 'r') as f:
    lst = f.readlines()
  lastname = lst[-1].strip() if lst else None
  return dirpath, filename, lastname, pubpath
	
def update(dirpath, filename, lastname, pubpath):
  if lastname is not None:
    setconfig(path.join(dirpath, lastname+'.config'), 'next', filename+'.html')
    setconfig(path.join(dirpath, filename+'.config'), 'last', lastname+'.html')
    setconfig(path.join(dirpath, filename+'.config'), 'date', date.today().isoformat())
  with open(pubpath, 'a') as f:
    f.write(filename + '\n')
	
if __name__ == '__main__':
  filepath = sys.argv[1]
  update(*thefiles(filepath))
