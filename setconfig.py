#!/usr/bin/env python3
import sys, os
import ast

def deserialize(input):
  return ast.literal_eval(input)

def serialize(d):
  pairs = (repr(k) + ": " + repr(v) for k,v in d.items())
  return "{ " + "\n, ".join(pairs) + "\n}\n"

def from_file(f):
  with open(f, 'r') as f:
    f = f.read()
  return deserialize(f)

def to_file(f, val):
  val = serialize(val)
  with open(f, 'w') as f:
    f.write(val)

def setconfig(file, key, value):
  d = from_file(file)
  d[key] = value
  to_file(file, d)

if __name__ == "__main__":
  setconfig(*sys.argv[1:4])
