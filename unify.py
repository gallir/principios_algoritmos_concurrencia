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
				to_include = re.match(r'include::(.*?)\[\]', line)
				if to_include:
					read_file(out, to_include.group(1), relative)
					#print("Include {}".format(to_include.group(1)))
				else:
					#print(line, end="")
					out.write(line)
		in_file.close()
	except:
		print("Error opening {}".format(configuration.out))
		sys.exit(1)

		


if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('file', help='asciidoc file')
	parser.add_argument('out', help='out asciidoc file')
	configuration = parser.parse_args()

	try:
		with open(configuration.out, "w") as out:
			read_file(out, configuration.file)
		out.close()
	except:
		print("Error opening output {}".format(outfile))
		sys.exit(1)


