#!/bin/sh

MODE=$1

# TODO add modes for training, running annotation server
if [ -z "$MODE"];
then
  MODE="ocr"
fi

for filename in `find ./docs -maxdepth 1 -name *.pdf`
# -printf "%f\n"`
do
  echo $filename
  bash -c "./preprocess.sh ocr $filename"
done
