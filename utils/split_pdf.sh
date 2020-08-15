#!/bin/bash

mkdir -p img
magick -verbose -density 400 $1 -density 200 -quality 100 -background white -alpha off "img/$(basename $1 .pdf)-%02d.png"

