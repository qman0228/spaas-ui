#! /bin/sh
mkdir temp_web
git config --global user.name "Barretem"
git config --global user.email "1178310248@qq.com"

if [ "$ROT_TOKEN" = "" ]; then
  echo "Bye~"
  exit 0
fi

# release 在打tag的时候，会进行release
if [ "$TRAVIS_TAG" ]; then
  # build lib 不需要进行lib处理
  # npm run dist
  # cd temp_web
  # git clone https://$ROT_TOKEN@github.com/ElementUI/lib.git && cd lib
  # rm -rf `find * ! -name README.md`
  # cp -rf ../../lib/** .
  # git add -A .
  # git commit -m "[build] $TRAVIS_TAG"
  # git tag $TRAVIS_TAG
  # git push origin master --tags
  # cd ../..

  # build theme-chalk 不需要进行theme处理
  # cd temp_web
  # git clone https://$ROT_TOKEN@github.com/ElementUI/theme-chalk.git && cd theme-chalk
  # rm -rf *
  # cp -rf ../../packages/theme-chalk/** .
  # git add -A .
  # git commit -m "[build] $TRAVIS_TAG"
  # git tag $TRAVIS_TAG
  # git push origin master --tags
  # cd ../..

  # build site
  npm run deploy:build
  cd temp_web
  git clone --depth 1 -b gh-pages --single-branch https://$ROT_TOKEN@github.com/spaasteam/spaas-ui.git && cd spaas-ui
  # build sub folder
  echo $TRAVIS_TAG

  SUB_FOLDER=`echo $TRAVIS_TAG | sed 's/.*V\([0-9].[0-9]*\).*/\1/g'`
  mkdir -p $SUB_FOLDER
  rm -rf *.js *.css *.map static
  rm -rf $SUB_FOLDER/**
  cp -rf ../../examples/element-ui/** .
  cp -rf ../../examples/element-ui/** $SUB_FOLDER/
  git add -A .
  git commit -m "$TRAVIS_COMMIT_MSG"
  git push origin gh-pages
  cd ../..

  # 通过钉钉进行通知
  ./build/notify.sh
  echo "DONE, Bye~"
  exit 0
fi

# build dev site 暂时不需要显示开发中的dev site
# npm run build:file && CI_ENV=/dev/$TRAVIS_BRANCH/ node_modules/.bin/cross-env NODE_ENV=production node_modules/.bin/webpack --config build/webpack.demo.js
# cd temp_web
# git clone https://$ROT_TOKEN@github.com/ElementUI/dev.git && cd dev
# mkdir $TRAVIS_BRANCH
# rm -rf $TRAVIS_BRANCH/**
# cp -rf ../../examples/element-ui/** $TRAVIS_BRANCH/
# git add -A .
# git commit -m "$TRAVIS_COMMIT_MSG"
# git push origin master
# cd ../..

# push dev theme-chalk
# cd temp_web
# git clone -b $TRAVIS_BRANCH https://$ROT_TOKEN@github.com/ElementUI/theme-chalk.git && cd theme-chalk
# rm -rf *
# cp -rf ../../packages/theme-chalk/** .
# git add -A .
# git commit -m "$TRAVIS_COMMIT_MSG"
# git push origin $TRAVIS_BRANCH
# cd ../..
