#! /bin/sh
set -ex
mkdir temp_web
npm run deploy:build
cd temp_web
git clone --depth 1 -b gh-pages --single-branch https://github.com/spaasteam/spaas-ui.git && cd spaas-ui

# build sub folder
SUB_FOLDER='2.12'
mkdir -p $SUB_FOLDER
rm -rf *.js *.css *.map static
rm -rf $SUB_FOLDER/**
cp -rf ../../examples/element-ui/** .
cp -rf ../../examples/element-ui/** $SUB_FOLDER/
cd ../..

# deploy domestic site
# faas deploy alpha -P element
# rm -rf temp_web
