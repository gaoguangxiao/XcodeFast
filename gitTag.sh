# 代码推送
#!/bin/sh

#1、读取版本和描述
#2、用标签制作tag

echo "\n ------ 执行 git 远程代码打标签操作 ------ \n"

podspec_version=$(sh ~/Documents/GitHub/XcodeFast/readPodSpec.sh "s.version")


echo "\n ------ 执行 git 打标签tag tag=【${podspec_version}】，并推送到远端 ------ \n"
# git推送到远端

echo "git tag ${podspec_version}"

git tag ${podspec_version}

echo "git push --tags"

git push origin master --tags