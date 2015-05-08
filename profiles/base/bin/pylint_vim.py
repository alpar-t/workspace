#!/usr/bin/python2
# -*- mode: Python; tab-width: 4; indent-tabs-mode: nil; -*- 
# ex: set tabstop=4 : 
# Please do not change the two lines above. See PEP 8, PEP 263. 
""" (c) Copyright 2012 Hewlett-Packard Development Company, L.P."""
import sys
import re
from subprocess import Popen, PIPE

args = " ".join( ["pylint", "--msg-template='{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}'", "--reports=n"] + sys.argv[1:])
output = Popen(args, stdout=PIPE, shell = True).communicate()[0].decode("UTF-8").splitlines()

def mykey(line):
	matcher = re.search(r"\[([A-Z])[0-9A-F]+", line)
	if not matcher:
		return 100
	if matcher.group(1) == 'F':
		return 0
	if matcher.group(1) == 'E':
		return 1
	if matcher.group(1) == 'W':
		return 2
	if matcher.group(1) == 'C':
		return 3
	if matcher.group(1) == 'R':
		return 4
	if matcher.group(1) == 'I':
		return 5


print("\n".join(sorted(output, key=mykey)))

