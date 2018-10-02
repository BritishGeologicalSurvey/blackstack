#!/bin/bash

MODE=$1

# TODO add modes for training, running annotation server
if [ -z "$MODE"];
then
  MODE="ocr"
fi

for filename in `find ./docs -maxdepth 1 -name "*.pdf" -printf "%f\n"`
do
  echo $filename
  bash -c "./preprocess.sh $MODE ./docs/$filename"
done

for f in *.{jpg,jp2,tif,TIFF}; do
    for filename in `find ./docs -maxdepth 1 -name "$f" -printf "%f\n"`
    do
      echo $filename
      bash -c "./preprocess.sh $MODE ./docs/$filename"
    done
done


