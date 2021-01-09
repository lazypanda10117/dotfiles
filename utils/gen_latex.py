import argparse

import subprocess

parser = argparse.ArgumentParser(description='Generate Latex Files')
parser.add_argument('filename', type=str, help="file name (i.e. assignment_1)")
parser.add_argument('-t', '--type', type=str, default='assignment', help='file type (i.e. assignment or note')

args = parser.parse_args()

filetype = args.type
filename = args.filename

if filetype in ['assignment', 'note']:
	subprocess.call(f'cp ~/dotfiles/latex/template/{filetype}.tex ./', shell=True)
	subprocess.call(f'mv ./{filetype}.tex ./{filename}.tex', shell=True)
else:
	throw(Exception(f"File type {filetype} does not exist."))

