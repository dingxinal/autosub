#!/bin/bash

#file path to be transcribed
FILES=

#file path to current dir
export PYTHONPATH=''
source ../../autoEnv/bin/activate
for f in $FILES; do
  filename=$(basename -- "$f")
  extension="${filename##*.}"
  filename="${filename%.*}"

  if [ ! -e "./${filename}.srt" ]; then
       echo "Converting file ${f}"
       python __init__.py $f
  else
       echo "Already transcribed file ${f}"
  fi
done