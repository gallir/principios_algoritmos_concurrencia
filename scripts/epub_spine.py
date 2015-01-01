#! /usr/bin/env python3

import re
import argparse
import os
import sys


def read_file(out, name, path = None):

	relative = os.path.dirname(name)
	if path:
		relative = os.path.join(path, relative)

	filename = os.path.join(relative, os.path.basename(name))

	#print("To read {} in {}".format(filename, relative))

	try:
		with open(filename,"rU") as in_file:
			for line in in_file:
				if len(line.strip()) > 0:
					out.write(line)
				else:
					out.write("\ninclude::"+filename+"[]\n")
					break
		in_file.close()
	except:
		print("Error opening {}".format(filename))
		sys.exit(1)

		


if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('file', help='asciidoc file')
	parser.add_argument('out', help='epub filename')
	configuration = parser.parse_args()

	try:
		with open(configuration.out, "w") as out:
			read_file(out, configuration.file)
		out.close()
	except:
		print("Error opening output {}".format(configuration.out))
		sys.exit(1)


