import argparse

from os import subprocess

argparse.ArgumentParser(description='Generate Latex Files')
parser.add_argument('type', type=str, default='assignment'
                    help='file type (i.e. assignment or note')
parser.add_argument('filename', type=str, required=True)

args = parser.parse_args()

filetype = args.type
filename = args.filename

if filetype == 'assignment':
	subprocess.call(f'cp ~/dotfiles/latex/template/assignment.tex ./{filename}.tex')
elif filetype == 'note':
	subprocess.call(f'cp ~/dotfiles/latex/template/note.tex ./{filename}.tex')
else:
	throw(Exception(f"File type {filetype} does not exist."))

