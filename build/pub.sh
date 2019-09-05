
# 设置全局变量
chmod 777 *.sh
./build/env.sh

# git-release
GREN_GITHUB_TOKEN=$GITHUB_TOKEN
gren release --override

# release
./build/release.sh

# algolia
node build/bin/gen-indices.js

# 通过订单进行通知
./build/notify.sh