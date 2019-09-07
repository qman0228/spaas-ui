
# 设置全局变量
chmod 777 ./build/*.sh
source ./build/env.sh

# release
./build/release.sh

# algolia
node build/bin/gen-indices.js

# git-release
GREN_GITHUB_TOKEN=$ROT_TOKEN
gren release --override
