import sys
import os
import re
import math
import logging

def ReadFile(fileName):
  f = open(fileName)
  content = f.readlines()
  f.close()
  li = []
  for line in content:
    line = line.strip()
    li.append(line)
  return li

def main():
  if len(sys.argv) != 2:
    print "Usage: ./%s filename"%(sys.argv[0])
    exit(-1)

  content = ReadFile(sys.argv[1])
  for line in sys.stdin:
    line = line.strip()
    tokens = line.split()


if __name__ == "__main__":
  logging.basicConfig(
      level = logging.INFO,
      # level = logging.DEBUG,
      format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
      datefmt='%Y-%H:%M:%S')
  main()
