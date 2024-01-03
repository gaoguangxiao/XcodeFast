# 代码推送
#!/bin/sh

#1、读取版本和描述
#2、用描述提交代码

echo "当前路径"

$pwd

podspec_summary=$(sh /Users/gaoguangxiao/Documents/GitHub/XcodeFast/readPodSpec.sh "s.summary")
podspec_version=${1}


echo "****** gitpush：描述 ${podspec_summary} ******"

echo "\n ------ 执行 git 本地提交代码操作 ------ \n"
# git 操作
echo "git add ."
git add .
echo "git status"
git status
echo "git commit -m ${podspec_summary}"
git commit -m ${podspec_summary}
