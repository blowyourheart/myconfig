#!/usr/bin/env python
# coding: utf-8
# Copyright 2012 JIKE.COM ALL Rights Reserved.
# Author: wangqun@jike.com
# created on 2013-05-24 18:51:19
# 通过读入一个cc文件名及其当前目录下的YBUILD内容来知道该cc文件在哪个target下，
# 从而构造ymake的t参数
# 使用方法 cat YBUILD | tr -t '\n' ' '| python find_target_via_source_file.py  test.cc
# 程序会输出目标target，否则为空。


#!/usr/bin/env python                                                                                                                            
#encoding=utf-8

import sys, re, os

def ReadFile(fileName):
  f = open(fileName)
  content = f.readlines()
  f.close()
  li = []
  for line in content:
    line = line.strip()
    li.append(line)
  return li

def PrintDepencyStruct(srcs, cc_filename):
  namepat = r'name\s*=\s*["\'](\S+?)["\']'
  srcspat = r'srcs\s*=\s*\[.*?\]'
  name_match = re.findall(namepat, srcs)
  if len(name_match) == 0:
    # print "cannot find target name"
    return ""
  # print "target name is %s"%name_match[0]
  srcs_match = re.findall(srcspat, srcs)
  if len(srcs_match) == 0:
    return ""
  if srcs_match[0].find(cc_filename) >= 0:
    return name_match[0]
  return ""

def main():
  # content = ReadFile("./list")
  if len(sys.argv) != 2:
    print "Usage: sys.argv[0] cc_src_filename"
    return 1
  pat = r"cc_(library|binary|test)\s*\((.*?)\)"
  for line in sys.stdin:
    line = line.strip()
    match = re.findall(pat, line, re.DOTALL)
    if len(match) == 0:
        print "no match"
        return 2
    # print "match len %d"%(len(match))
    result = []
    for i in range(len(match)):
      target_type, srcs = match[i][0], match[i][1]
      # print "target count: %s"%i
      # print "target_type: %s\nsrcs: %s"%(target_type, srcs)
      target = PrintDepencyStruct(srcs, sys.argv[1])
      if len(target):
        print target
        return 0
  return 1

if __name__ == "__main__":
  main()
