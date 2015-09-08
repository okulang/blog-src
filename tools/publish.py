#!/usr/bin/env python3
import sys, os
from os import path
from setconfig import setconfig
from datetime import datetime

def thefiles(filepath):
  dirpath, filename = path.split(filepath)
  pubpath = path.join(dirpath, 'publish')
  with open(pubpath, 'r') as f:
    lst = f.readlines()
  lastname = lst[-1].strip() if lst else None
  return dirpath, filename, lastname, pubpath
	
def update(dirpath, filename, lastname, pubpath):
  if lastname is not None:
    setconfig(path.join(dirpath, lastname+'.pyon'), 'next', filename+'.html')
    setconfig(path.join(dirpath, filename+'.pyon'), 'last', lastname+'.html')
  pubdate = datetime.utcnow().strftime("%a, %d %b %Y %H:%M:%S +0000")
  setconfig(path.join(dirpath, filename+'.pyon'), 'date', pubdate)
  with open(pubpath, 'a') as f:
    f.write(filename + '\n')
	
if __name__ == '__main__':
  filepath = sys.argv[1]
  update(*thefiles(filepath))
