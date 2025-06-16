#!/bin/bash
if [ "$1" == "" ]
then
    echo "Usage: sort.sh <filename.p2f>"
    exit 1
fi

xsltproc sort-p2f.xslt $1 > /tmp/bla.xml
cp /tmp/bla.xml $1
rm /tmp/bla.xml

if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' "s/\"/'/g" $1
else
    sed -i "s/\"/'/g" $1
fi
